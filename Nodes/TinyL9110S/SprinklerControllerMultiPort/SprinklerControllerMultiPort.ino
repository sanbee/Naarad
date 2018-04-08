// -*- C++ -*-
// --------------------------------------------------------------------------------------
// ATtiny84 Based Wireless temperature sensor (based on Tiny-Tx) and
// sprinkler controller for DC latching solenoids.
// By S. Bhatnagar (sanbeepie@gmail.com).
//
// GNU GPL V3
//--------------------------------------------------------------------------------------
// Connections between ATTiny84 MCU and the RFM69CW module:
//
//       ATT84          RFM69CW
//         D1             NSS
//         D2             DI00
//      MOSI, D4          MISO
//      MISO, D5          MOSI
//      SCK, D6           SCK
//
// Will these same connection also work when ATT84 is programmed for
// both Rx and Tx?

#define RF69_COMPAT 1
#pragma message("Compiling in RF69_COMPAT mode")
#include <JeeLib.h> // https://github.com/jcw/jeelib
#include <avr/power.h>
#include "RemoteCmd.h" // List of remote commands
ISR(WDT_vect) { Sleepy::watchdogEvent(); } // interrupt handler for JeeLabs Sleepy power saving

#define SERVER_NODE_ID 5
#define MY_NODE_ID     16                     // RF12 node ID in the range 1-30
#define network        210                   // RF12 Network group
#define freq           RF12_433MHZ  // Frequency of RFM12B module

#define PORT0  PIN_A0  // A0,D10 (ATtiny pin 13)
#define PORT1  PIN_A1  // A1,D9  (ATtiny pin 12)
#define PORT2  PIN_A2  // A2,D8  (ATtiny pin 11)
#define PORT3  PIN_A3  // A3,D7  (ATtiny pin 10)
#define PORT4  PIN_A7  // A7,D3  (ATtiny pin 6)

int RFM69_READ_TIMEOUT = 3000, // 3 sec 
  SYS_SHUTDOWN_INTERVAL=60000, // 60 sec
  SYS_SHUTDOWN_INTERVAL_MULTIPLIER=1,
  VALVE_PULSE_WIDTH=10,
  PULSE_WIDTH_MULTIPLIER=1; // 10 ms

#define RCV_TIMEDOUT      10
#define RCV_GOT_SOME_PKT  20
#define RCV_GOT_VALID_PKT 30

// Macros to extrat NodeID, Port No., Command and Timeout values
// packed in the int-elements of the PayLoad struct.
// #define GET_NODEID(p)   ((p.supplyV) & (0xFF)) /* Bits 0-7 */
// #define GET_PORT(p)     ((p.supplyV) >> (8) & (0xFF)) /* Bits 8-15 */
// #define GET_CMD(p)      ((p.temp) & (0xFF)) /* Bits 0-7 */
// #define GET_TIMEOUT(p)  ((p.temp) >> (8) & (0b1111)) /*  Bits 8-15 */


inline static short int getNibble(short int target, short int which)
{
  return (target >> (which*8)) & (0xFF);
}
#define GET_CMD(p)      (getNibble(p.supplyV,1))
#define GET_NODEID(p)   (getNibble(p.supplyV,0))
#define GET_PORT(p)     (getNibble(p.temp,1))
#define GET_TIMEOUT(p)  (getNibble(p.temp,0))
#define GET_PARAM1(p)   (getNibble(p.temp,1)) /* Get the parameter for the SET_* commands*/
#define GET_PARAM0(p)   (getNibble(p.temp,0)) /* Get the parameter for the SET_* commands*/

#define MASK_PORTA 0b10001111 //Only bits with 1 will be modified
#define MASK_PORTB 0b00000001 //Only bits with 1 will be modified
#define N_PORTS 5
#define SETBIT(t,n)  (t |= 1<<n)
#define CLRBIT(t,n)  (t &= ~(1 << n))
static const byte port2BitMap[N_PORTS]={0,1,2,3,7}; //Pins: A0, A1,A2,A3,A7
#define getPORTA() (PORTA)
#define getPORTB() (PORTB)



// Utility macros
// #define adc_disable() (ADCSRA &= ~(1<<ADEN)) // disable ADC (before power-off)
// #define adc_enable()  (ADCSRA |=  (1<<ADEN)) // re-enable ADC
//bitClear(PRR, PRADC); ADCSRA |= bit(ADEN); // Enable the ADC
//ADCSRA &= ~ bit(ADEN); bitSet(PRR, PRADC); // Disable the ADC to save power
  

byte dataReady=0;
unsigned long lastRF;                    // used to check for RF recieve failures
int payload_nodeID;
//###################
//Data Structure to be sent
//###################

typedef struct
{
  int temp;	// Temperature reading: re-used for receiving cmd
  int supplyV;	// Supply voltage; re-used for receiving target nodeID
 } Payload;

int tempReading,cmd=-1, port=0;
unsigned long valveTimeout=60000,TimeOfLastValveCmd=0; /*1 min*/
Payload payLoad_RxTx;
uint16_t freqOffset=1600;

//#################################################################
void setup()
{
  // rf12_initialize(MY_NODE_ID,freq,network,freqOffset); // Initialize RFM12 with settings defined above 
  // rf12_sleep(0);                          // Put the RFM12 to sleep

  analogReference(INTERNAL);  // Set the aref to the internal 1.1V reference
 
  pinMode(PORT0, OUTPUT);
  pinMode(PORT1, OUTPUT);
  pinMode(PORT2, OUTPUT);
  pinMode(PORT3, OUTPUT);
  pinMode(PORT4, OUTPUT);

}
//#################################################################
void loop()
{
  power_adc_enable();

  for(byte port=0;port<N_PORTS;port++)
    {
      setSolenoid(OPEN,port);
      Sleepy::loseSomeTime(60*1000);
      setSolenoid(CLOSE,port);
      setSolenoid(SHUT,port);
      Sleepy::loseSomeTime(5*1000);
    }

  power_adc_disable();//Claim is that with this, the current consumption is down to 0.2uA from 230uA (!)
  SYS_SHUTDOWN_INTERVAL_MULTIPLIER=2*24*60; //minutes in 2 days
  SYS_SHUTDOWN_INTERVAL=60000; // One minute -- close to the maximum possible with looseSomeTime()
  for(unsigned int i=0;i<SYS_SHUTDOWN_INTERVAL_MULTIPLIER;i++)
    Sleepy::loseSomeTime(SYS_SHUTDOWN_INTERVAL); //JeeLabs power save function: enter low power mode for 60 seconds (valid range 16-65000 ms)
}
void setPortA(byte& port,const byte& val)
{
  port = (port & ~MASK_PORTA) | (val & MASK_PORTA);
}

void setPortB(byte& port,const byte& val)
{
  port = (port & ~MASK_PORTB) | (val & MASK_PORTB);
}


void setSolenoid(const byte& cmd, const byte& port)
{
  byte CommonPin=0, Pin1=0;
  // portA and portB values should be set to whatever is the current
  // value of PORTA and PORTB registers.
  byte portA=getPORTA(), portB=getPORTB();
  // If CommonPin is 1, B0 and A0-3,A7 should be set to 1. Since the
  // bits that can change in PORTA and PORTB is controlled by
  // MASK_PORTA and MASK_PORTB, setting CommonPin=0b11111111 and then
  // blindly using it to set the bits in PORTA and PORTB will work.
  if      (cmd == OPEN)  {CommonPin=0xFF; Pin1=0;}
  else if (cmd == CLOSE) {CommonPin=0;  Pin1=1;} 

  // printf("P, S, C: %d %d %d\n",port2BitMap[port], (CommonPin==-1)?1:0, Pin1);

  // Set both pins of all ports to the same value as the CommonPin
  // value, effectively issuing the SHUT command to all ports.  No
  // current should be drawn from the battery by any of the ports in
  // this state
  setPortB(portB, CommonPin);
  setPortA(portA, CommonPin);

  // Now set the other pin of the specific port.  port2BitMap maps the
  // port number to the bits in the PORTA.
  if (Pin1==1) SETBIT(portA,port2BitMap[port]);
  else         CLRBIT(portA,port2BitMap[port]);
    
  // Finally, copy the pin settings to PORTA and PORTB registers.  The
  // lines below actually sets the hardware.
  PORTA=portA;
  PORTB=portB;
  // printf("B: "); showbits(PORTB);
  // printf("A: "); showbits(PORTA);
  // printf("Insert 10ms delay\n");
  // setPortA(PORTA,0x00);
  // CLRBIT(PORTB, 0);//setPortB(PORTB,0x00);
  // printf("B: "); showbits(PORTB);
  // printf("A: "); showbits(PORTA);
}
//
//#################################################################
//#################################################################
//
// Application specific functions
// static void controlSolenoid(const int cmd)
// {
//   // First handle system commands (these modify the internal
//   // parameters, but don't control the valve solenoid.  THESE SHOULD
//   // IMMEDIATELY RETURN AFTER SERVICING THE COMMANDS.
//   if (cmd==NOOP) return;
//   if (cmd==SET_RX_TO)                          {RFM69_READ_TIMEOUT = 1000*GET_PARAM1(payLoad_RxTx);return;} // Default 3 sec.
//   if (cmd==SET_TX_INT)
//     {
//       SYS_SHUTDOWN_INTERVAL = 1000*GET_PARAM1(payLoad_RxTx); // Default 60 sec.
//       SYS_SHUTDOWN_INTERVAL_MULTIPLIER=GET_PARAM0(payLoad_RxTx);
//       SYS_SHUTDOWN_INTERVAL_MULTIPLIER=((SYS_SHUTDOWN_INTERVAL_MULTIPLIER==0)?1:SYS_SHUTDOWN_INTERVAL_MULTIPLIER);
//       return;
//     };
//   if (cmd== SET_VALVE_PULSE_WIDTH)
//     {
//       VALVE_PULSE_WIDTH = GET_PARAM1(payLoad_RxTx); // Default 10 ms.
//       PULSE_WIDTH_MULTIPLIER = GET_PARAM0(payLoad_RxTx);//Detaul 1
//       return;
//     };
//   //
//   // Service the solenoid control commands
//   //
//   if (cmd==OPEN)
//     {
//       digitalWrite(SOLENOID_CTL0, HIGH);
//       digitalWrite(SOLENOID_CTL1, LOW);
//       for(byte i=0;i<PULSE_WIDTH_MULTIPLIER;i++) delay(VALVE_PULSE_WIDTH);
//       TimeOfLastValveCmd=millis(); // Record the time when OPEN command is issued.
//     }
//   else if (cmd==CLOSE)
//     {
//       digitalWrite(SOLENOID_CTL0, LOW);
//       digitalWrite(SOLENOID_CTL1, HIGH);
//       for(byte i=0;i<PULSE_WIDTH_MULTIPLIER;i++) delay(VALVE_PULSE_WIDTH);
//       TimeOfLastValveCmd=0; // Record that the valve is off now
//     }
//   //  else //Comment this line, and uncomment the delays in above blocks
//        //to ensure that OPEN and CLOSE are always followed by a delay
//        //and SHUT
//     {
//       digitalWrite(SOLENOID_CTL0, LOW);
//       digitalWrite(SOLENOID_CTL1, LOW);
//       TimeOfLastValveCmd=0; // Record that the valve is off now
//     }
// }

// //--------------------------------------------------------------------------------------------------
// // Send payload data via RF
// //--------------------------------------------------------------------------------------------------
// static void rfwrite(const byte wakeup)
//  {
//    if (wakeup==1) rf12_sleep(-1);     //wake up RF module
//    while (!rf12_canSend()) rf12_recvDone();
//    rf12_sendStart(0, &payLoad_RxTx, sizeof payLoad_RxTx); 
//    rf12_sendWait(1);    //wait for RF to finish sending while in IDLE (1) mode (standby is 2 -- does not work with JeeLib 2018)
//    rf12_sleep(0);    //put RF module to sleep
// }

// //--------------------------------------------------------------------------------------------------
// // Read current supply voltage
// //--------------------------------------------------------------------------------------------------
// static long readVcc()
//  {
//    long result;
//    // Read 1.1V reference against Vcc
//    ADMUX = _BV(MUX5) | _BV(MUX0);
//    delay(2); // Wait for Vref to settle
//    ADCSRA |= _BV(ADSC); // Convert
//    while (bit_is_set(ADCSRA,ADSC));
//    result = ADCL;
//    result |= ADCH<<8;
//    result = 1126400L / result; // Back-calculate Vcc in mV
//    return result;
// }

// static int readRFM69() 
// {
//   //  digitalWrite(LEDPIN,LOW);    // turn LED off
  
//   // On data receieved from rf12
//   //################################################################
  
//   //  if (rf12_recvDone() && rf12_crc == 0 && (rf12_hdr & RF12_HDR_CTL) == 0) 
//   if (rf12_recvDone() && rf12_crc == 0)
//     {
//       payload_nodeID = rf12_hdr & 0x1F;   // extract node ID from received packet
//       payLoad_RxTx=*(Payload*) rf12_data; // Get the payload

//       dataReady = 1;                   // Ok, data is ready
      
//       if ((payload_nodeID != SERVER_NODE_ID) && (GET_NODEID(payLoad_RxTx) != MY_NODE_ID)) return -1;

//       cmd=GET_CMD(payLoad_RxTx);
//       port=GET_PORT(payLoad_RxTx);
//       valveTimeout=GET_TIMEOUT(payLoad_RxTx)*60*1000;//Convert user value in min. to milli sec.
//       valveTimeout=(valveTimeout==0?60000:valveTimeout);

//       if (cmd == 0)      return CLOSE;
//       else if (cmd == 1) return OPEN;
//       else if (cmd== 2) return SHUT;
//       else return cmd;
//     }
//     return -1;
// }
