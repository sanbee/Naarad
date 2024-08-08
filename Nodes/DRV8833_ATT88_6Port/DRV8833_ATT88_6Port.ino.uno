// -*- C++ -*-
// -------------------------------------------------------------------------
// ATtiny88 Based Wireless sprinkler controller for DC latching solenoids.
// By S. Bhatnagar (sanbeepie@gmail.com).
//
// Copyright (c) 2019 S.Bhatnagar
// 
//  This file is part of the Naarad software.
// 
//  Naarad is a free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
// 
//  Naarad is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
// 
//  You should have received a copy of the GNU General Public License
//  along with Naarad.  If not, see <https:www.gnu.org/licenses/>.
// 
//--------------------------------------------------------------------------
// Connections between ATTiny88 MCU and the RFM69CW module:
//
//    ATT88 Physical Pin              RFM69CW Pins
//       16 (SS)                        7 (NSS)
//       17 (MOSI)                      5 (MOSI)
//       18 (MISO)                      8 (MISO)
//       19 (SCK)                       6 (SCK)
//        4 (INT0/2/PCINT18/PD2)        9 (DI00)
//
//
// Connections between ATTiny88 MCU and Arduino as ISP
//
// Arduino UNO Pin labels       Physical Pin on ATTiny88-PU
//      10 (SS)                         1 (RESET)
//      11 (MOSI)                      17 (MOSI)
//      12 (MISO)                      18 (MISO)
//      13 (SCK)                       19 (SCK)
//      3.3V                           20 (VACC) and 7 (VCC)
//      GND                            22 (GND)

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

#define PIN_SLP PD5  // D6 (AT88 pin 11)
#define COMMN  PD6  // D6 (AT88 pin 12) IB1_0, IA1_0, IB1_1, IA1_1, IB1_2, IA1_2
#define SPORT0  PB0  // B0 (AT88 pin 14) IB2_0
#define SPORT1  PD7  // D7 (AT88 pin 13) IA2_0
#define SPORT2  PD4  // D4 (AT88 pin 06) IB2_1
#define SPORT3  PD3  // D3 (AT88 pin 05) IA2_1
#define SPORT4  PD1  // D1 (AT88 pin 03) IB2_2
#define SPORT5  PD0  // D0 (AT88 pin 02) IA2_2

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

#define N_DRV_PORTS 6
#define getPORTD() (PORTD)
#define getPORTB() (PORTB)

#define PORTD_MASK 0b11011011 //bits 0,1,3,4,6,7
#define PORTB_MASK 0b00000001 // bit 0
#define SLP_MASK   0b00100000 // bit 5

#define HIGH_L     0b11111111
#define LOW_L      0b00000000


// Bit 5 for PORTD maps to ping PD5 for DRV8833 SLP (common)
//static const byte SLP_D={5};   // Pin D05

// PORTB bit 0 maps to PIN_B0, which is common for DRV8833 IA1_0, IB1_0, IA1_1, IB1_1, IA1_2, IB1_2
//static const byte COMMON_D={6};             //Pins: D06

// PORTD bit map for DRV8833 IA2_0, IB2_0, IA2_1, IB2_1, IA2_2, IB2_2
//static const byte portD2BitMap[N_PORT_CTRL_BITS_D]={0,1,3,4,7}; //Pins: D0, D1, D3, D4, D7

// PORTB bit 0 maps to PIN_B0, which is common for DRV8833 IA1_0, IB1_0, IA1_1, IB1_1, IA1_2, IB1_2
//static const byte portB2BitMap[1]={6};             //Pins: B00

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
//
//#################################################################
//
void showbits(byte x)
{
    int i; 
    for(i=(sizeof(x)*8)-1; i>=0; i--)
      {
	(x&(1u<<i))?Serial.print('1'):Serial.print('0');
	if (i%4==0) Serial.print(' ');
      }
    
    Serial.println("\n");
}
//
//#################################################################
//
void setup()
{
  Serial.begin(19200);
  // rf12_initialize(MY_NODE_ID,freq,network,freqOffset); // Initialize RFM12 with settings defined above 
  // rf12_sleep(0);                          // Put the RFM12 to sleep

  //  uint8_t pp = digitalPinToPort(PIN_SLP);
  analogReference(INTERNAL);  // Set the aref to the internal 1.1V reference
 
  pinMode(PIN_SLP, OUTPUT);
  pinMode(COMMN, OUTPUT);
  pinMode(SPORT0, OUTPUT);
  pinMode(SPORT1, OUTPUT);
  pinMode(SPORT2, OUTPUT);
  pinMode(SPORT3, OUTPUT);
  pinMode(SPORT4, OUTPUT);
  pinMode(SPORT5, OUTPUT);

  byte port;
  // CLOSE all ports.  This generates a 10ms pulse which draws current
  // and therefore must be done one port at a time.
  for(port=0; port< N_DRV_PORTS; port++) setSolenoidPort(CLOSE,port); 
  setSolenoidPort(SHUT,0); // This will set both lines of all ports to LOW

  // Set A0-3, A7 and B0 to LOW
  setPort(port,LOW_L,PORTD_MASK);PORTD=port;
  setPort(port,LOW_L,PORTB_MASK);PORTB=port;
  SYS_SHUTDOWN_INTERVAL_MULTIPLIER=2*24*60; //minutes in 2 days
  SYS_SHUTDOWN_INTERVAL=60000; // One minute -- close to the maximum possible with looseSomeTime()
  Sleepy::loseSomeTime(5000); //JeeLabs power save function: enter low power mode for 60 seconds (valid range 16-65000 ms)
  
  //  power_adc_enable();
}
//
//#################################################################
//
void loop()
{
  //Calls to measure size of the program
  // rfwrite(0);
  // int cmd = readRFM69();
  // controlSolenoid(cmd);

  for(byte port=0;port<N_DRV_PORTS;port++)
    {
      Serial.println("---------------------------------------------");
      Serial.print("Port: ");Serial.println(port);
      // setSolenoidPort(OPEN,port); // This generates a 10ms pulse which draws current
      // hibernate(60000,1);
      setSolenoidPort(CLOSE,port);// This generates a 10ms pulse which draws current
      // hibernate(5000,1);
    }


  //power_adc_disable();//Claim is that with this, the current consumption is down to 0.2uA from 230uA (!)
  hibernate(SYS_SHUTDOWN_INTERVAL,SYS_SHUTDOWN_INTERVAL_MULTIPLIER);
}
//
//#################################################################
//
void hibernate(const unsigned int& timeout, const unsigned int& multiplier)
{
  power_adc_disable();
  for(unsigned int i=0;i<multiplier;i++)
    Sleepy::loseSomeTime(timeout); //JeeLabs power save function: enter low power mode for 60 seconds (valid range 16-65000 ms)
  power_adc_enable();
}
//
//#################################################################
//
//                                      IA2_0           IB2_0         IA2_1           IB2_1         IA2_2          IB2_2
//                                       D7              B0             D3             D4            D0              D1
static byte DRV_PIN2_MASK[]={0b10000000, 0b00000001, 0b00001000, 0b00010000, 0b00000001, 0b00000010};
//static byte DRV_PIN2_MASK[]={0b00000001, 0b10000000, 0b00010000, 0b00001000, 0b10000000, 0b01000000};
//
void setPort(byte& port,const byte& val, const byte& mask)
{port = (port & ~mask) | (val & mask);}

void setSolenoidPort(const byte& cmd, const byte& cPort)
{
  byte IN1, IN2, portD_l=getPORTD(), portB_l=getPORTB();
  if      (cmd==OPEN)  {IN1=HIGH_L; IN2=LOW_L;} // HIGH, LOW
  else if (cmd==CLOSE) {IN1=LOW_L; IN2=HIGH_L;} // LOW, HIGH
  else /*SHUT*/          {IN1=LOW_L; IN2=LOW_L;} // LOW, LOW

  // Set both DRV pins of all ports to the same value (IN1)
  // Set all DRV IN{A,B}2 pins to same value (IN1).  PD6 is the IN{A,B}1 pin for all DRV ports
  setPort(portD_l, IN1, PORTD_MASK); // PD{0,1,3,4,6,7}=IN1
  setPort(portB_l, IN1, PORTB_MASK); // PB0=IN1;  IB2_0
  
  // Set DRV SLP to HIGH
  setPort(portD_l,   HIGH_L, SLP_MASK); // PD5/SLP_D=HIGH
  delay(5);
  
  if (cPort==1) setPort(portB_l, IN2, DRV_PIN2_MASK[cPort]);
  else          setPort(portD_l, IN2, DRV_PIN2_MASK[cPort]);

  Serial.println("   76S4 3?10");
  Serial.println("   |||| ||||");
  Serial.print("B: "); showbits(portB_l);
  Serial.print("D: "); showbits(portD_l);
  // PORTD=portD_l;
  // PORTB=portB_l;

  delay(20);

  // After 20msec, set all DRV port pins and SLP pin to LOW
  setPort(portD_l, LOW_L, PORTD_MASK);
  setPort(portD_l, LOW_L, SLP_MASK); // PD5/SLP_D=LOW
  setPort(portB_l, LOW_L, PORTB_MASK);

  Serial.println("delay 20ms");
  Serial.print("B: "); showbits(portB_l);
  Serial.print("D: "); showbits(portD_l);

  // PORTD=portD_l;
  // PORTB=portB_l;
  delay(10);
}
//
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
  if (cmd==OPEN)
    {
      digitalWrite(0, HIGH);
      digitalWrite(1, LOW);
      for(byte i=0;i<PULSE_WIDTH_MULTIPLIER;i++) delay(VALVE_PULSE_WIDTH);
      TimeOfLastValveCmd=millis(); // Record the time when OPEN command is issued.
    }
  else if (cmd==CLOSE)
    {
      digitalWrite(0, LOW);
      digitalWrite(1, HIGH);
      for(byte i=0;i<PULSE_WIDTH_MULTIPLIER;i++) delay(VALVE_PULSE_WIDTH);
      TimeOfLastValveCmd=0; // Record that the valve is off now
    }
  //  else //Comment this line, and uncomment the delays in above blocks
       //to ensure that OPEN and CLOSE are always followed by a delay
       //and SHUT
    {
      digitalWrite(0, LOW);
      digitalWrite(1, LOW);
      TimeOfLastValveCmd=0; // Record that the valve is off now
    }
}

// //--------------------------------------------------------------------------------------------------
// // Send payload data via RF
// //--------------------------------------------------------------------------------------------------
static void rfwrite(const byte wakeup)
 {
   if (wakeup==1) rf12_sleep(-1);     //wake up RF module
   while (!rf12_canSend()) rf12_recvDone();
   rf12_sendStart(0, &payLoad_RxTx, sizeof payLoad_RxTx); 
   rf12_sendWait(1);    //wait for RF to finish sending while in IDLE (1) mode (standby is 2 -- does not work with JeeLib 2018)
   rf12_sleep(0);    //put RF module to sleep
}

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