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

// This version of the code has been tested to work with ATT88 clocked at 4 and 8MHz.
// The current code is for running it at 4MHz.  For running at 8 MHz, remove the first 4
// lines of code in setup().  THE CODE DOES NOT WORK AT 1 MHz (THE RADIO DOES NOT WORK
// BELOW 4 MHZ https://jeelabs.org/2011/12/10/inside-the-rf12-driver/).
//
// This code has been tested on the breadboard and the PCB with the RFM unit
// connected. Tests to operate the 6 ports by OTA commands has also been tested.  This
// latter test was by monitoring the INA2 or INB2 control lines going from ATT88 to the
// DRV8833 by sending the CLOSE command.
//
// THE CONNECTIONS BELOW HAVE BEEN TESTED TO WORK.  MOSI/MISO CONNECTIONS BETWEEN
// ATT88 AND RF69 ARE *OPPOSITE* OF WHAT WORKS ON ATT84.  DON'T UNDERSTAND THIS!
//                                    SANJAY, O1OCT2019
//
// The connections below are the right one and are different from connections with ATT84
// because ATT84 has USI not full hardware SPI. For details see
// https://github.com/SpenceKonde/ATTinyCore#spi-support.
//                                    SANJAT, 09OCT2019
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
#include "ATTiny88Pins.h"
ISR(WDT_vect) { Sleepy::watchdogEvent(); } // interrupt handler for JeeLabs Sleepy power saving

#define SERVER_NODE_ID 5
#define MY_NODE_ID     15                    // RF12 node ID in the range 1-30
#define network        210                   // RF12 Network group
#define freq           RF12_433MHZ  // Frequency of RFM12B module
#define RFM_WAKEUP -1
#define RFM_SLEEP_FOREVER 0

#define RCV_TIMEDOUT      10
#define RCV_GOT_SOME_PKT  20
#define RCV_GOT_VALID_PKT 30
#define MAX_RX_ATTEMPTS 50000  // Keep it <= 65535
#define VALVE_DEFAULT_ON_TIME 10000 //10 sec.

#define PIN_SLP PIN_PD5  // D5 (AT88 pin 11), IDE pin no. D5, but use 5 in the code instead.  Go figure!
#define COMMN   PIN_PD6  // D6 (AT88 pin 12) IB1_0, IA1_0, IB1_1, IA1_1, IB1_2, IA1_2: IDE pin no. D6, but use 6 in the code instead.  Go figure!
#define SPORT0  PIN_PB0  // B0 (AT88 pin 14) IB2_0, IDE pin no. D8, but use 8 in the code instead.  Go figure!
#define SPORT1  PIN_PD7  // D7 (AT88 pin 13) IA2_0, IDE pin no. D7, but use 7 in the code instead.  Go figure!
#define SPORT2  PIN_PD4  // D4 (AT88 pin 06) IB2_1, IDE pin no. D4, but use 4 in the code instead.  Go figure!
#define SPORT3  PIN_PD3  // D3 (AT88 pin 05) IA2_1, IDE pin no. D3, but use 3 in the code instead.  Go figure!
#define SPORT4  PIN_PD1  // D1 (AT88 pin 03) IB2_2, IDE pin no. D1, but use 1 in the code instead.  Go figure!
#define SPORT5  PIN_PD0  // D0 (AT88 pin 02) IA2_2, IDE pin no. D0, but use 0 in the code instead.  Go figure!

int RFM69_READ_TIMEOUT = 3000, // 3 sec 
  SYS_SHUTDOWN_INTERVAL=60000, // 60 sec
  SYS_SHUTDOWN_INTERVAL_MULTIPLIER=1,
  VALVE_PULSE_WIDTH=10,
  PULSE_WIDTH_MULTIPLIER=4; // 10 ms

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

int tempReading,cmd=NOOP, inPort=0;
unsigned int MaxRxCounter=0;
unsigned long valveTimeout=60000,TimeOfLastValveCmd=0; /*1 min*/
Payload payLoad_RxTx;
uint16_t freqOffset=1600;
//                                      IA2_0           IB2_0         IA2_1           IB2_1         IA2_2          IB2_2
//                                       D7              B0             D3             D4            D0              D1
static byte DRV_PIN2_MASK[]={0b10000000, 0b00000001, 0b00001000, 0b00010000, 0b00000001, 0b00000010};
static byte port=0x00;
//static byte DRV_PIN2_MASK[]={0b00000001, 0b10000000, 0b00010000, 0b00001000, 0b10000000, 0b01000000};

#define adc_disable() (ADCSRA &= ~(1<<ADEN)) // disable ADC (before power-off)
#define adc_enable() (ADCSRA |= (1<<ADEN)) // re-enable ADC
void initPins()
{
  // pinMode(PIN_PD0, OUTPUT); 
  pinMode(PIN_SLP, OUTPUT); 
  pinMode(COMMN, OUTPUT);
  pinMode(SPORT0, OUTPUT);
  pinMode(SPORT1, OUTPUT);
  pinMode(SPORT2, OUTPUT);
  pinMode(SPORT3, OUTPUT);
  pinMode(SPORT4, OUTPUT);
  pinMode(SPORT5, OUTPUT);
}
//#################################################################
void setup()
{
  adc_enable();

  //---------------FOR RUNNING ATT88 AT 4MHz---------------------------------
  // The 4 lines below are required only for running the ATT88 at 4MHz. The full
  // instructions about the procedure using Arudino IDE are at
  // https://forum.arduino.cc/index.php?topic=624890.msg4233505#msg4233505
  //
  // Add to (your documents folder)/hardware/ATTinyCore/avr/boards.txt the follwing lines in the attinyx8 section:
  // attinyx8.menu.clock.4internal=4 MHz (must set CLKPR in sketch)
  // attinyx8.menu.clock.4internal.bootloader.low_fuses=0x62
  // attinyx8.menu.clock.4internal.build.f_cpu=4000000L
  // attinyx8.menu.clock.4internal.bootloader.file=empty/empty_all.hex
  //
  // At the top of your setup(), add the following 4 lines of code:
  //
  cli(); //disable interrupts - this is a timed sequence.
  CLKPR=0x80; //change enable
  CLKPR=0x01; //set prescaler to 2
  sei(); //enable interrupts
  //---------------FOR RUNNING ATT88 AT 4MHz---------------------------------

  // RFFreq = 43*10000000 +band*2500*1600)/1e6 == 434.0MHz
  // Eq. to compute RFFreq is in RF69_compact.cpp::rf69_initialize()
  rf12_initialize(MY_NODE_ID,freq,network,freqOffset); // Initialize RFM12 with settings defined above 
  rf12_sleep(0);                          // Put the RFM12 to sleep

  //  uint8_t pp = digitalPinToPort(PIN_SLP);
  analogReference(INTERNAL);  // Set the aref to the internal 1.1V reference
 
  initPins();

  //  /*-------------------------TEST---------------------------------------
  // CLOSE all ports.  This generates a 10ms pulse which draws current
  // and therefore must be done one port at a time.
  for(port=0; port< N_DRV_PORTS; port++) 
    {
      setSolenoidPort(CLOSE,port); 
      setSolenoidPort(SHUT,port); // This will set both lines of all ports to LOW
    }

  // Set A0-3, A7 and B0 to LOW
  port=PORTD; 
  setPort(port,LOW_L,PORTD_MASK);  setPort(port, LOW_L, SLP_MASK); 
  PORTD=port;

  port=PORTB;
  setPort(port,LOW_L,PORTB_MASK);
  PORTB=port;
  //  -------------------------TEST---------------------------------------*/

  SYS_SHUTDOWN_INTERVAL_MULTIPLIER=1; //minutes in 2 days
  SYS_SHUTDOWN_INTERVAL=5000; // One minute -- close to the maximum possible with looseSomeTime()
  Sleepy::loseSomeTime(1000); //JeeLabs power save function: enter low power mode for 60 seconds (valid range 16-65000 ms)
  adc_enable();
  
  //  power_adc_enable();
}
//#################################################################
void loop()
{
  // rf12_initialize(MY_NODE_ID,freq,network,freqOffset); // Initialize RFM12 with settings defined above

  // initPins();

  // for(byte i=0;i<3;i++)
  //   {
  //     digitalWrite(COMMN,HIGH);
  //     delay(100);
  //     digitalWrite(COMMN,LOW);
  //     delay(100);
  //   }
  // delay(1000);



  // port=PORTD;
  // setPort(port, HIGH_L, SLP_MASK); 
  // PORTD=port;
  // delay(1000);
  // port=PORTD;
  // setPort(port, LOW_L, SLP_MASK); 
  // PORTD=port;

  if ((TimeOfLastValveCmd>0)&&((unsigned long)(millis() - TimeOfLastValveCmd) >= valveTimeout))
    {executeCommand(CLOSE);TimeOfLastValveCmd=0;}

  payLoad_RxTx.temp = int((((double(tempReading/10.0)*0.942382812) - 500)/10)*100);

  payLoad_RxTx.supplyV = readVcc(); // Get supply voltage

  rfwrite(1);

  lastRF=millis();
  rf12_sleep(RFM_WAKEUP);
  delay(10);

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

  //  delay(10); // With the receiver ON, this delay is necessary for the
	     // second packet to be issued.  What's the minimum delay?

  if (dataReady != RCV_TIMEDOUT)
    {
      dataReady=RCV_GOT_VALID_PKT;
      // Following is an ACK packet which is captured by all listener
      // stations (but currently processed only by the base station)
      rfwrite(1);
    }
  rf12_sleep(RFM_SLEEP_FOREVER);    //put RF module to sleep
  //=============================================================================
  // End radio operations
  //

  //  /*-------------------------TEST---------------------------------------
  // If cmd has valid value, process it.
  if (cmd >=0 ) 
    {
      executeCommand(cmd);
    }
  //  -------------------------TEST---------------------------------------*/

  //power_adc_disable();//Claim is that with this, the current consumption is down to 0.2uA from 230uA (!)
  //adc_disable();//Claim is that with this, the current consumption is down to 0.2uA from 230uA (!)

  // digitalWrite(COMMN,HIGH);
  // delay(4000);
  // digitalWrite(COMMN,LOW);

  // port=PORTD;
  // setPort(port, HIGH_L, SLP_MASK); 
  // PORTD=port;
  // delay(3000);
  // port=PORTD;
  // setPort(port, LOW_L, SLP_MASK); 
  // PORTD=port;


  // for(port=0;port<6;port++)
  //   {
  //     setSolenoidPort(OPEN,port); // This generates a 10ms pulse which draws current
  //     hibernate(valveTimeout,1);//(6000,10);
  //     setSolenoidPort(CLOSE,port);// This generates a 10ms pulse which draws current
  //     //hibernate(5000,1);
  //     //      setSolenoidPort(SHUT,port);
  //     //hibernate(5000,1);
  //   }
  {
    // The code block leaves port pins in low state, but they draw some residual current.
    // Don't know why (the LEDs on the test circuit glow weakly)
    // port=PORTD;
    // setPort(port, LOW_L, PORTD_MASK);
    // setPort(port, LOW_L, SLP_MASK); 
    // PORTD=port;

    // port=PORTB;
    // setPort(port, LOW_L, PORTB_MASK); 
    // PORTB=port;
  }
  // adc_disable();  //power_adc_disable();//Claim is that with this, the current consumption is down to 0.2uA from 230uA (!)
  // for(byte i=0;i<SYS_SHUTDOWN_INTERVAL_MULTIPLIER;i++)
  //   Sleepy::loseSomeTime(SYS_SHUTDOWN_INTERVAL); //JeeLabs power save function: enter low power mode for 60 seconds (valid range 16-65000 ms)

  hibernate(SYS_SHUTDOWN_INTERVAL,SYS_SHUTDOWN_INTERVAL_MULTIPLIER);
}

void hibernate(const unsigned int& timeout, const unsigned int& multiplier)
{
  //delay(timeout*multiplier); return;
  //power_adc_disable();
  adc_disable();
  for(unsigned int i=0;i<multiplier;i++)
    Sleepy::loseSomeTime(timeout); //JeeLabs power save function: enter low power mode for 60 seconds (valid range 16-65000 ms)
  adc_enable();
  //power_adc_enable();
}


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
  //digitalWrite(PIN_SLP, HIGH);
  setPort(portD_l,   HIGH_L, SLP_MASK);// PD5/SLP_D=HIGH
  //delay(5);
  
  if (cPort==1) setPort(portB_l, IN2, DRV_PIN2_MASK[cPort]);
  else          setPort(portD_l, IN2, DRV_PIN2_MASK[cPort]);
  PORTD=portD_l;
  PORTB=portB_l;

  // printf("   0123 4567\n");
  // printf("   |||| ||||\n");
  // printf("B: "); showbits(portB_l);
  // printf("D: "); showbits(portD_l);

  // Wait for MULTIPLIER*PULSE_WIDTH time deliver a pulse.
  for(byte i=0;i<PULSE_WIDTH_MULTIPLIER;i++) delay(VALVE_PULSE_WIDTH);
  //  delay(40);

  // After the pulse (40msec by default), set all DRV port pins and SLP pin to LOW
  
  setPort(portD_l, LOW_L, SLP_MASK); // PD5/SLP_D=LOW
  setPort(portD_l, LOW_L, PORTD_MASK);
  setPort(portB_l, LOW_L, PORTB_MASK);
  PORTD=portD_l;
  PORTB=portB_l;

  // printf("delay 20ms\n");
  // printf("B: "); showbits(portB_l);
  // printf("D: "); showbits(portD_l);

  // delay(10);
}

//#################################################################
//#################################################################
//
// Application specific functions
//
//#################################################################
//#################################################################
//
// Application specific functions
static void executeCommand(const int cmd)
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
  setSolenoidPort(cmd,inPort);
  if (cmd==OPEN) TimeOfLastValveCmd=millis(); // Record the time when OPEN command is issued.
}
// //--------------------------------------------------------------------------------------------------
// // Send payload data via RF
// //--------------------------------------------------------------------------------------------------
static void rfwrite(const byte wakeup)
 {
   if (wakeup==1) 
     {
       rf12_sleep(-1);     //wake up RF module
       delay(10);
     }
   while (!rf12_canSend()) rf12_recvDone();
   rf12_sendStart(0, &payLoad_RxTx, sizeof payLoad_RxTx); 
   rf12_sendWait(1);    //wait for RF to finish sending while in IDLE (1) mode (standby is 2 -- does not work with JeeLib 2018)
   rf12_sleep(0);    //put RF module to sleep
}

//--------------------------------------------------------------------------------------------------
// Read current supply voltage
//--------------------------------------------------------------------------------------------------
static long readVcc()
 {
   long result;
   // Read 1.1V reference against Vcc
#if defined(__AVR_ATTINY84__)
   ADMUX = _BV(MUX5) | _BV(MUX0);
#else
   ADMUX = _BV(REFS0) | _BV(MUX3) | _BV(MUX2) | _BV(MUX1);
#endif

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
      inPort=GET_PORT(payLoad_RxTx);
      valveTimeout=GET_TIMEOUT(payLoad_RxTx)*60*1000;//Convert user value in min. to milli sec.
      valveTimeout=(valveTimeout==0?60000:valveTimeout);

      if (cmd == 0)      return CLOSE;
      else if (cmd == 1) return OPEN;
      else if (cmd== 2) return SHUT;
      else return cmd;
    }
    return -1;
}
//
//---------------Old code for reference-------------------------------------
//
// #define SETBIT(t,n)  (t |= 1<<n)
// #define CLRBIT(t,n)  (t &= ~(1 << n))
// void setPortD(byte& port,const byte& val)
// {
//   port = (port & ~MASK_PORTD) | (val & MASK_PORTD);
// }

// void setPortB(byte& port,const byte& val)
// {
//   port = (port & ~MASK_PORTB) | (val & MASK_PORTB);
// }

// void setSolenoid(const byte& cmd, const byte& port, const byte& bitMap)
// {
//   byte CommonPin=0, Pin1=0;
//   // portD and portB values should be set to whatever is the current
//   // value of PORTD and PORTB registers.
//   byte portD=getPORTD(), portB=getPORTB();
//   // If CommonPin is 1, B0 and A0-3,A7 should be set to 1. Since the
//   // bits that can change in PORTD and PORTB is controlled by
//   // MASK_PORTD and MASK_PORTB, setting CommonPin=0b11111111 and then
//   // blindly using it to set the bits in PORTD and PORTB will work.
//   if      (cmd == OPEN)  {CommonPin=0xFF; Pin1=0;}
//   else if (cmd == CLOSE) {CommonPin=0;  Pin1=1;} 

//   // printf("P, S, C: %d %d %d\n",port2BitMap[port], (CommonPin==-1)?1:0, Pin1);

//   // Set both pins of all ports to the same value as the CommonPin
//   // value, effectively issuing the SHUT command to all ports.  No
//   // current should be drawn from the battery by any of the ports in
//   // this state
//   setPortB(portB, CommonPin);
//   setPortD(portD, CommonPin);

//   // Now set the other pin of the specific port.  port2BitMap maps the
//   // port number to the bits in the PORTD.
//   if (Pin1==1) SETBIT(portD,bitMap[port]);
//   else         CLRBIT(portD,bitMap[port]);
    
//   // Finally, copy the pin settings to PORTD and PORTB registers.  The
//   // lines below actually sets the hardware.
//   PORTD=portD;
//   PORTB=portB;
//   // printf("B: "); showbits(PORTB);
//   // printf("A: "); showbits(PORTD);
//   // printf("Insert 10ms delay\n");

//   // 10ms later, remove the voltage (issue the SHUT command)
//   delay(10);
//   setPortD(portD,0x00);
//   CLRBIT(portB, 0);//setPortB(PORTB,0x00);
//   PORTD=portD;
//   PORTB=portB;
//   delay(10);
// }
//
