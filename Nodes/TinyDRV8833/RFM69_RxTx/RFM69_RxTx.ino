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
//#include <avr/power.h>
#include "RemoteCmd.h" // List of remote commands
ISR(WDT_vect) { Sleepy::watchdogEvent(); } // interrupt handler for JeeLabs Sleepy power saving
// Utility macros
#define adc_disable() (ADCSRA &= ~(1<<ADEN)) // disable ADC (before power-off)
#define adc_enable() (ADCSRA |= (1<<ADEN)) // re-enable ADC

#define SERVER_NODE_ID 5
#define MY_NODE_ID     16                     // RF12 node ID in the range 1-30
#define network        210                   // RF12 Network group
#define freq           RF12_433MHZ  // Frequency of RFM12B module

#define tempPin       PIN_A0      // TMP36 Vout connected to A0,D10 (ATtiny pin 13)
#define tempPower     PIN_A1      //was:9    TMP36 Power pin is connected on pin A1,D9 (ATtiny pin 12)
#define SOLENOID_CTL0 PIN_A2      // A2,D8 (ATtiny pin 11)
#define SOLENOID_CTL1 PIN_A3      // A3,D7 (ATtiny pin 10)

#define PIN_BIN2   PIN_A1  // Physical pin 12 - BIN2 (PH)
#define PIN_BIN1   PIN_A2  // Physical pin 11 - BIN1 (EN)
#define PIN_SLP     PIN_A3  // Physical pin 10 - SLP

#define RFM_WAKEUP -1
#define RFM_SLEEP_FOREVER 0

int RFM69_READ_TIMEOUT = 3000, // 3 sec 
  SYS_SHUTDOWN_INTERVAL=60000, // 60 sec
  SYS_SHUTDOWN_INTERVAL_MULTIPLIER=1,
  VALVE_PULSE_WIDTH=10,
  PULSE_WIDTH_MULTIPLIER=1; // 10 ms

#define RCV_TIMEDOUT      10
#define RCV_GOT_SOME_PKT  20
#define RCV_GOT_VALID_PKT 30
#define MAX_RX_ATTEMPTS 50000  // Keep it <= 65535

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
unsigned int MaxRxCounter=0;
unsigned long valveTimeout=60000,TimeOfLastValveCmd=0; /*1 min*/
Payload payLoad_RxTx;
uint16_t freqOffset=1600;
//MilliTimer sendTimer;

// class PacketBuffer : public Print {
// public:
//     PacketBuffer () : fill (0) {}
//     const char* buffer() { return buf; }
//     byte length() { return fill; }
//     void reset() { fill = 0; }
//     virtual size_t write(uint8_t ch)
//         { if (fill < sizeof buf) buf[fill++] = ch; }  
//     byte fill;
//     char buf[150];
//     private:
// };
// static PacketBuffer str;

//#################################################################
void setup()
{
  rf12_initialize(MY_NODE_ID,freq,network,freqOffset); // Initialize RFM12 with settings defined above 
  rf12_sleep(RFM_SLEEP_FOREVER);                          // Put the RFM12 to sleep

  analogReference(INTERNAL);  // Set the aref to the internal 1.1V reference
 
  //pinMode(tempPower, OUTPUT); // set power pin for TMP36 to output
  pinMode(PIN_BIN1,OUTPUT);
  pinMode(PIN_BIN2,OUTPUT);
  pinMode(PIN_SLP,OUTPUT);

  adc_enable(); 
  CTRLSOLENOID(CLOSE);
  controlSolenoid(SHUT); delay(5);
  digitalWrite(PIN_SLP, LOW);  
  delay(100);
  adc_disable(); 
}
//#################################################################
void loop()
{
  // Turn-on the temperature sensor, read it and send the data via RF
  //----------------------------------------------------------------------------------------

  if ((TimeOfLastValveCmd>0)&&((unsigned long)(millis() - TimeOfLastValveCmd) >= valveTimeout))
    {controlSolenoid(CLOSE);TimeOfLastValveCmd=0;}
  // digitalWrite(tempPower, HIGH); // turn TMP36 sensor on
  // delay(10); // Allow 10ms for the sensor to be ready


  // analogRead(tempPin); // throw away the first reading
  // //payLoad_RxTx.temp=0.0;
  // tempReading=0;
  // for(byte i = 0; i < 10 ; i++) // take 10 more readings
  //   //payLoad_RxTx.temp += analogRead(tempPin); // accumulate readings
  //   tempReading += analogRead(tempPin); // accumulate readings

  // digitalWrite(tempPower, LOW); // turn TMP36 sensor off
  payLoad_RxTx.temp = int((((double(tempReading/10.0)*0.942382812) - 500)/10)*100);

  payLoad_RxTx.supplyV = readVcc(); // Get supply voltage
  
  rfwrite(1); // Send data via RF
  delay(10); // Without this delay, the second packet is never issued.  Why? 10ms does not work.  100ms does.  Is 10<d<100 possible?
  
  lastRF=millis();
  rf12_sleep(RFM_WAKEUP);

  // readRFM69() returns command if it gets a packet from the server
  // node with a target ID of this node.  It returns -1 otherwise (if
  // it did not get a packet or if the packet was not from the server
  // node or not meant for this node).
  cmd=-1;
  MaxRxCounter=0;
  while ((cmd=readRFM69())==-1)
    {
      if (
	  ((millis() - lastRF) > (unsigned long)RFM69_READ_TIMEOUT) ||
	  (MaxRxCounter > MAX_RX_ATTEMPTS)
	  )
	{
	  dataReady=RCV_TIMEDOUT;
	  break;
	}
      MaxRxCounter++;
    }

  delay(10); // With the receiver ON, this delay is necessary for the second packet to be issued.  What's the minimum delay?

  // rfwrite(1) puts RFM69 to sleep.  loseSomeTime() below puts the MCU to sleep for the specified length of time.

  if (dataReady != RCV_TIMEDOUT)
    {
      dataReady=RCV_GOT_VALID_PKT;
      controlSolenoid(cmd);
      
      // Following is an ACK packet which is captured by the base station (acutully right now by all listeners).
      rfwrite(1);
    }

  rf12_sleep(RFM_SLEEP_FOREVER);    //put RF module to sleep
  //power_adc_disable();//Claim is that with this, the current consumption is down to 0.2uA from 230uA (!)
  adc_disable();//Claim is that with this, the current consumption is down to 0.2uA from 230uA (!)
  for(byte i=0;i<SYS_SHUTDOWN_INTERVAL_MULTIPLIER;i++)
    Sleepy::loseSomeTime(SYS_SHUTDOWN_INTERVAL); //JeeLabs power save function: enter low power mode for 60 seconds (valid range 16-65000 ms)
}
//
//#################################################################
//#################################################################
//
// Application specific functions
static void controlSolenoid(const int cmd)
{
  // First handle system commands (these modify the internal
  // parameters, but don't control the valve solenoid.  THESE SHOULD
  // IMMEDIATELY RETURN AFTER SERVICING THE COMMANDS.
  if (cmd==NOOP) return;
  if (cmd==SET_RX_TO)                          {RFM69_READ_TIMEOUT = 1000*GET_PARAM1(payLoad_RxTx);return;} // Default 3 sec.
  if (cmd==SET_TX_INT)
    {
      SYS_SHUTDOWN_INTERVAL = 1000*GET_PARAM1(payLoad_RxTx); // Default 60 sec.
      SYS_SHUTDOWN_INTERVAL_MULTIPLIER=GET_PARAM0(payLoad_RxTx);
      SYS_SHUTDOWN_INTERVAL_MULTIPLIER=((SYS_SHUTDOWN_INTERVAL_MULTIPLIER==0)?1:SYS_SHUTDOWN_INTERVAL_MULTIPLIER);
      return;
    };
  if (cmd== SET_VALVE_PULSE_WIDTH)
    {
      VALVE_PULSE_WIDTH = GET_PARAM1(payLoad_RxTx); // Default 10 ms.
      PULSE_WIDTH_MULTIPLIER = GET_PARAM0(payLoad_RxTx);//Detaul 1
      return;
    };
  //
  // Service the solenoid control commands
  //
  //power_adc_enable();
  adc_enable();
  digitalWrite(PIN_SLP, HIGH);  delay(5);//Switch ON the MOFSET that supplies 9V supply to DRV and set DRV8833 to sleep.

  if (cmd==OPEN)
    {
      digitalWrite(PIN_BIN1, HIGH);
      digitalWrite(PIN_BIN2, LOW);
      //for(byte i=0;i<PULSE_WIDTH_MULTIPLIER;i++) delay(VALVE_PULSE_WIDTH);
      TimeOfLastValveCmd=millis(); // Record the time when OPEN command is issued.
    }
  else if (cmd==CLOSE)
    {
      digitalWrite(PIN_BIN1, LOW);
      digitalWrite(PIN_BIN2, HIGH);
      //for(byte i=0;i<PULSE_WIDTH_MULTIPLIER;i++) delay(VALVE_PULSE_WIDTH);
      //TimeOfLastValveCmd=0; // Record that the valve is off now
    }
  //Ensure that OPEN and CLOSE are always followed by a delay to
  //produce a finite pulse and then the SHUT command to set the CTL
  //pins LOW
  for(byte i=0;i<PULSE_WIDTH_MULTIPLIER;i++) delay(VALVE_PULSE_WIDTH);
  digitalWrite(PIN_SLP, LOW);  //Switch OFF the MOFSET that supplies 9V supply to DRV and set DRV8833 to sleep.


    {
      digitalWrite(PIN_BIN1, LOW);
      digitalWrite(PIN_BIN2, LOW);
      //TimeOfLastValveCmd=0; // Record that the valve is off now
    }
  //power_adc_disable();//Claim is that with this, the current consumption is down to 0.2uA from 230uA (!)
  adc_disable();//Claim is that with this, the current consumption is down to 0.2uA from 230uA (!)
}

//--------------------------------------------------------------------------------------------------
// Send payload data via RF
//--------------------------------------------------------------------------------------------------
static void rfwrite(const byte wakeup)
 {
   if (wakeup==1) rf12_sleep(RFM_WAKEUP);     //wake up RF module
   while (!rf12_canSend()) rf12_recvDone();
   rf12_sendStart(0, &payLoad_RxTx, sizeof payLoad_RxTx); 
   rf12_sendWait(1);    //wait for RF to finish sending while in IDLE (1) mode (standby is 2 -- does not work with JeeLib 2018)
   rf12_sleep(RFM_SLEEP_FOREVER);    //put RF module to sleep
}

//--------------------------------------------------------------------------------------------------
// Read current supply voltage
//--------------------------------------------------------------------------------------------------
static long readVcc()
 {
   long result;
   // Read 1.1V reference against Vcc
   ADMUX = _BV(MUX5) | _BV(MUX0);
   delay(2); // Wait for Vref to settle
   ADCSRA |= _BV(ADSC); // Convert
   while (bit_is_set(ADCSRA,ADSC));
   result = ADCL;
   result |= ADCH<<8;
   result = 1126400L / result; // Back-calculate Vcc in mV
   return result;
}

static int readRFM69() 
{
  //  digitalWrite(LEDPIN,LOW);    // turn LED off
  
  // On data receieved from rf12
  //################################################################
  
  //  if (rf12_recvDone() && rf12_crc == 0 && (rf12_hdr & RF12_HDR_CTL) == 0) 
  if (rf12_recvDone() && rf12_crc == 0)
    {
      payload_nodeID = rf12_hdr & 0x1F;   // extract node ID from received packet
      payLoad_RxTx=*(Payload*) rf12_data; // Get the payload

      dataReady = 1;                   // Ok, data is ready
      
      if ((payload_nodeID != SERVER_NODE_ID) && (GET_NODEID(payLoad_RxTx) != MY_NODE_ID)) return -1;

      cmd=GET_CMD(payLoad_RxTx);
      port=GET_PORT(payLoad_RxTx);
      valveTimeout=GET_TIMEOUT(payLoad_RxTx)*60*1000;//Convert user value in min. to milli sec.
      valveTimeout=(valveTimeout==0?60000:valveTimeout);

      if (cmd == 0)      return CLOSE;
      else if (cmd == 1) return OPEN;
      else if (cmd== 2) return SHUT;
      else return cmd;
    }
    return -1;
}
