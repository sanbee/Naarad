/* -*-C-*- */
//--------------------------------------------------------------------------------------
// ATtiny84 based wireless sensor (based on Tiny-Tx) and sprinkler
// controller for DC latching solenoids.
// By S. Bhatnagar (sanbeepie@gmail.com)
//
// GNU GPL V3
//--------------------------------------------------------------------------------------
// This code accepts RFM_SEND command with the following usage:
//     RFM_SEND CMD NODEID PARAM1 PARAM0
//        CMD:     See RemoteCmd.h for details
//        NODEID:  The target node ID
//        PARAM1:  The port on the target node.
//                 Each node can have multiple ports/solenoids
//        PARAM0:  The time in integral number of minutes, after which the
//                 solenoid will be CLOSED and the port SHUT (both control pins LOW)
//
// See RemoteCmd.h for details on various values of CMD, PARAM1 and PARAM2. 
//
// The parameters are packed in the two integers of the Payload struct:
//
//              CMD   NODEID       PARAM1 PARAM0
//    Byte No.   1      0            1     0
//             Payload.supplyV      Payload.rx1
//
// The macros SET/GET_{CMD,NODEID,PORT,TIMEOUT} do the packing/unpacking.
//
// This code also has a SEND-ACK protocol for RFM_SEND. The remote
// node echos the RFM_SEND command as soon as it gets it. The RFM_SEND
// command is re-send for N_TRILS number of trials if this ACK packet
// from the remote node is not received.  The resend will continue on
// the arrival of a packet (containing the sensor values) from the
// remote node till an ACK is received.
//
#define SEQ_LEN 35

int outputRFTxPin = 6;
int sensorTMP36Pin = 0; //the analog pin the TMP36's Vout (sense) pin is connected to
char cmdStr[SEQ_LEN];
char seqReady = 0;
char serialCount;

//########################################################################################################################
//########################################################################################################################
//########################################################################################################################
#define RF69_COMPAT 1
#if RF69_COMPAT == 1
#pragma message("Compiling in RF69_COMPAT")
#endif
#include <JeeLib.h>    // https://github.com/jcw/jeelib


#include "RemoteCmd.h"// The remote commands for sprinkler controller
//MilliTimer sendTimer;

// Fixed RFM69CW settings
#define MYNODE 5            // node ID 30 reserved for base station
#define freq RF12_433MHZ     // frequency
#define group 210            // network group 

#define APIKEY  "b872449aa3ba74458383a798b740a378" // API write key 

#define LEDPIN 13
#define BAUDRATE 19200

#define DEBUG 

#define NOTHING_TO_SEND -1
#define N_TRIALS 5
#define N_LISTENERS 1
byte listenerNodeIDList[1]={15};
//########################################################################################################################
//Data Structure to be received 
//########################################################################################################################
typedef struct
{
  int rx1;		    // received value
  int supplyV;              // payload voltage
} Payload;

Payload payload; 
Payload TX_payload;
static byte rssi2, rssi1, rssiMantisa;
static byte TX_counter, TX_Mode_On=0;
#define SET_CMD(p,v)      (p.supplyV = setNibble(p.supplyV,v,1))
#define SET_NODEID(p,v)   (p.supplyV = setNibble(p.supplyV,v,0))
#define SET_PORT(p,v)     (p.rx1 = setNibble(p.rx1,v,1))
#define SET_TIMEOUT(p,v)  (p.rx1 = setNibble(p.rx1,v,0))

#define GET_CMD(p)      (getNibble(p.supplyV,1))
#define GET_NODEID(p)   (getNibble(p.supplyV,0))
#define GET_PORT(p)     (getNibble(p.rx1,1))
#define GET_TIMEOUT(p)  (getNibble(p.rx1,0))
//########################################################################################################################
// The PacketBuffer class is used to generate the json string that is send via ethernet - JeeLabs
//########################################################################################################################
class PacketBuffer : public Print {
public:
    PacketBuffer () : fill (0) {}
    const char* buffer() { return buf; }
    byte length() { return fill; }
    void reset() { for(fill=0;fill<150;fill++)buf[fill] = '\0';fill=0;}
    virtual size_t write(uint8_t ch)
        { if (fill < sizeof buf) buf[fill++] = ch; }  
    byte fill;
    char buf[150];
 private:
};
static PacketBuffer str;

//########################################################################################################################

// Flow control varaiables
int dataReady=0;                         // is set to 1 when there is data ready to be sent
unsigned long lastRF;                    // used to check for RF recieve failures
uint16_t freqOffset=1600;
//########################################################################################################################
//########################################################################################################################
//########################################################################################################################


void setup() 
{
#ifdef DEBUG
  Serial.begin(BAUDRATE);
  Serial.println("Base Station: ");
  Serial.print(" Node: "); Serial.print(MYNODE); 
  Serial.print(" Freq: "); Serial.print("433MHz"); 
  Serial.print(" Network group: "); Serial.println(group);
#if RF69_COMPAT
  Serial.println(" Working in RF69 Compatibility mode (RF12B Compat. mode actually)");
#endif
#endif
  delay(10);
  rf12_initialize(MYNODE, freq,group,freqOffset);
  lastRF = millis()-10000;   // setting lastRF back in time
  
  initOOKRadio();
  Serial.println("Receiver ready");

  // Set the node ID in the TX_payload to invalid value to indicate that there is nothing to send yet.
  // Reset the re-try counter and set the TX mode to OFF.
  TX_payload.supplyV=NOTHING_TO_SEND;
  TX_counter = 0;
  TX_Mode_On=0;
}

void loop() 
{
  if (seqReady) 
    {
      //For debugging -- write the full command on the serial output stream
      //writeln(cmdStr,serialCount);

      // TX the sequence of 25 bits from char. 5 onwards via the RF TX
      // connected on outputRFTXPin
      if (strncmp(cmdStr, "SEND",4)==0)
	{
	  for (char i = 0; i < 5; i++) 
	    {
	      TXSequence(cmdStr+5,25);
	      delay(5);
	    }
	}
      if (strncmp(cmdStr, "RFM_SEND",8)==0)
	{
	  // Extract the value of the target node ID and the command to send from the cmdStr.
	  // Set up the TX_payload to be sent send the server decides to transmit the payload.
	  //Serial.println(cmdStr);

	  TX_payload.supplyV=TX_payload.rx1=0;
	  // RFM_SEND    CMD NODEID      PORT TIMEOUT
	  //               supplyV          rx1
	  char *token; char s[2] = " ";
	  // CMD
	  token=strtok(cmdStr+9,s);
	  int v; sscanf(token,"%d",&v);  
	  SET_CMD(TX_payload,v);
	  //TX_payload.supplyV=v;  // The command

	  // NODIED
	  token=strtok(NULL, s);
	  sscanf(token,"%d",&v); 
	  SET_NODEID(TX_payload,v);
	  //TX_payload.rx1=v;  // The target node ID

	  // PORT
	  token=strtok(NULL, s);
	  sscanf(token,"%d",&v); 
	  SET_PORT(TX_payload,v);
	  
	  // TIMEOUT
	  token=strtok(NULL, s);
	  sscanf(token,"%d",&v); 
	  SET_TIMEOUT(TX_payload,v);
	  // This is a debugging message printed as a JSON string on
	  // the serial port with rf_fail:1 so that the server
	  // listening on the serial port need not process it further.
	  Serial.println("{\"rf_fail\":1,\"source\":\"Got RFM_SEND\",\"cmd\":"+String(GET_CMD(TX_payload))
			 +",\"node\":" + String(GET_NODEID(TX_payload))+" "
			 +",\"port\":" + String(GET_PORT(TX_payload))+" "
			 +",\"TIMEOUT\":" + "\"" + String(GET_TIMEOUT(TX_payload))+" " +String(TX_counter)+"\" }\0"); 

	}
      // Read a value from sensorTMP36PIN and return the value as
      // temperature in degC
      else if (strncmp(cmdStr, "GETT",4)==0)
	{
	  float val = readTemperature();
	  str.reset();
	  str.print("{\"rf_fail\":0");             // RF recieved so no failure
	  str.print(",\"degc\":");   str.print(val); 
	  str.print(",\"node_id\":0");
	  str.print(",\"source\":\"RS0\" }\0");
	  Serial.println(str.buf);
	  //Serial.println(val);
	  //delay(10);
	}
      else if (strncmp(cmdStr, "GETR",4)==0)
	{
	  char *msg=NULL;
	  while ((msg = readRFM69())==NULL);
	  Serial.println(msg);
	}
      // Reset the command string
      seqReady = 0;
      serialCount = 0;
      cmdStr[0]='\0';
    }
  else  
    {
      char *msg=NULL;
      if ((msg = readRFM69())!=NULL)
	Serial.println(msg);
    }
}

static void initOOKRadio() 
{
  pinMode(outputRFTxPin, OUTPUT);
  // Set the output pin to high impedence state
  digitalWrite(outputRFTxPin, LOW);
}

static bool inList(const int& val,const byte list[])
{
  for (byte i=0; i<N_LISTENERS; i++)
    if (list[i] == val) return true;
  return false; 
}

static short int getNibble(short int target, short int which)
{
  return (target >> (which*8)) & (0xFF);
}

static short int setNibble(short int word, short int nibble, short int whichNibble)
{
  short int shift = whichNibble * 8;
  return (word & ~(0xf << shift)) | (nibble << shift);
}

//--------------------------------------------------------------------------------------------------
// Send payload data via RF
//--------------------------------------------------------------------------------------------------
 static void rfwrite()
 {
   if (TX_payload.supplyV != NOTHING_TO_SEND)
     {
       rf12_sleep(-1);     //wake up RF module
       while (!rf12_canSend()) rf12_recvDone();
       rf12_sendStart(0, &TX_payload, sizeof TX_payload); 
       rf12_sendWait(1);    //wait for RF to finish sending while in IDLE (1) mode (standby is 2 -- does not work with JeeLib 2018)
       rf12_sendStart(0, &TX_payload, sizeof TX_payload); 
       rf12_sendWait(1);    //wait for RF to finish sending while in IDLE (1) mode (standby is 2 -- does not work with JeeLib 2018)

       // Invalidate the payload.
       // TX_payload.supplyV=NOTHING_TO_SEND;
       //       rf12_sleep(0);    //put RF module to sleep
     }
}

static void processACK(const int rx_nodeID, const int rx_rx, const int rx_supplyV)
{
  // That this is an ACK packet is determined with the following
  // logic:
  //
  //   1. If the nodeID from which the current packet was received is
  //      the same as the nodeID in the TX_payload (the nodeID for
  //      which the transmitted packet was targetted), and
  //
  //   2. If the rx1 value of the received packet has the same value
  //      as the rx1 value of the last transmitted packet
  //
  // then the received packet is an ACK for the last transmitted
  // packet from the receiver node.

  //  if ((rx_nodeID == TX_payload.supplyV) && (rx_rx == TX_payload.rx1))
  if ((rx_nodeID == GET_NODEID(TX_payload)) && (rx_rx == TX_payload.rx1))
    {
      Serial.println("{\"rf_fail\":1,\"source\":\"ACKpkt:\",\"cmd\":"+String(GET_CMD(TX_payload))
		     +",\"node\":" + String(GET_NODEID(TX_payload))
		     +",\"t2\": "+String(rx_rx)
		     +",\"t3\": "+String(rx_nodeID)+" }\0"); 
      // Invalidate the TX payload
      TX_payload.supplyV=NOTHING_TO_SEND;
      TX_Mode_On = TX_counter = 0;
    }
}

char* readRFM69() 
{
  //  digitalWrite(LEDPIN,LOW);    // turn LED off
  
  int payload_nodeID=NOTHING_TO_SEND;
  //########################################################################################################################
  // On data receieved from RFM69
  //########################################################################################################################
  if (rf12_recvDone() && rf12_crc == 0 && (rf12_hdr & RF12_HDR_CTL) == 0) 
    {
      payload_nodeID = rf12_hdr & 0x1F;   // extract node ID from received packet
      //      digitalWrite(LEDPIN,HIGH);                   // Turn LED on
      rssi2 = RF69::rssi;
      rssi1 = rssi2>>1;
      rssiMantisa = rssi2-(rssi1<<1);

      payload=*(Payload*) rf12_data;         // Get the payload
      
      // JSON creation: format: {key1:value1,key2:value2} and so on
      
      str.reset();                           // Reset json string     
      str.print("{\"rf_fail\":0,");             // RF recieved so no failure
      
      // Add node ID
      str.print("\"node_id\":"); str.print(payload_nodeID); 
      // Add reading 
      str.print(",\"degc\":");   str.print(payload.rx1/100.0); 
      // Add tx battery voltage reading
      str.print(",\"node_v\":"); str.print(payload.supplyV/1000.0);
      // Add received power (in dB)
      str.print(",\"node_p\":"); str.print(-(rssi1));
      if (rssiMantisa) str.print(PSTR(".5"));
      //str.print(PSTR("dB"));
      
      str.print(",\"source\":\"RS0\" }\0");
      
      dataReady = 1;                   // Ok, data is ready
      lastRF = millis();               // reset lastRF timer
      //      digitalWrite(LEDPIN,LOW);        // Turn LED OFF
      
      processACK(payload_nodeID, payload.rx1, payload.supplyV);

#ifdef DEBUG
      //      Serial.println("Data received");
#endif
      //if ((payload_nodeID == TX_payload.supplyV) || (TX_Mode_On != 0))
      if ((payload_nodeID == GET_NODEID(TX_payload)) || (TX_Mode_On != 0))
	{
	  if (TX_counter < N_TRIALS)
	    {
	      // Print a debug message on the serial output as a JSON
	      // string.  It is required to be a JSON string so that
	      // the Naarad server listening on the serial port does
	      // not go nuts.  "rf_fail":1 ensures that the Naarad
	      // server will not process the string further.
	      Serial.println("{\"rf_fail\":1,\"source\":\"Sending RFM_SEND\",\"cmd\":"+String(GET_CMD(TX_payload))
			     +",\"node\":" + String(GET_NODEID(TX_payload))+" "
			     +",\"port\":" + String(GET_PORT(TX_payload))+" "
			     +",\"TIMEOUT\":" + "\"" + String(GET_TIMEOUT(TX_payload))+" "
			     +String(TX_counter)+"\" }\0"); 
	      /* Serial.println(TX_payload.supplyV); */
	      //sendTimer.poll(10);
	      delay(100);
	      rfwrite();
	      TX_counter++;
	      TX_Mode_On=1;
	    }
	  else
	    TX_Mode_On = TX_counter = 0;
	}

      // If the command cache (TX_payload) had nothing to send, send a
      // ping as a NOOP command.  This will ensure that radio on the
      // remote node is ON for the minimum possible time and the
      // remote MCU will not do anything.
      if (inList(payload_nodeID,listenerNodeIDList) && (TX_payload.supplyV == NOTHING_TO_SEND))
	{
	  TX_payload.supplyV=0; // Without this, rfwrite() detects the payload as NOTHING_TO_SEND
	  SET_CMD(TX_payload, NOOP);
	  SET_NODEID(TX_payload,payload_nodeID);
	  delay(50); // Without this, the packets are not transmitted.
	  rfwrite();
	}

      return str.buf;
    }
  // If no data is recieved from rf12 module the server is updated every 30s with RFfail = 1 indicator for debugging
  else if ((millis()-lastRF)>15000)
    {
      lastRF = millis();                      // reset lastRF timer
      str.reset();                            // reset json string
      str.print("{\"rf_fail\":1 }\0");        // No RF received in 30 seconds so send failure 
      dataReady = 1;                          // Ok, data is ready
    }
  
  

  if (dataReady==1)                       // If data is ready: return the data to the host computer
    {
// #ifdef DEBUG
//     Serial.println(str.buf);
// #endif
      dataReady = 0;
      // If the Tx mode is ON, send the command sitting in TX_payload.
      // This ensures that the sending the command is tried for a fixed
      // number of tries at the fasted rate possible (irrepective of
      // whether the receive block below was activated or not
      if ((TX_Mode_On!=0) && (TX_counter < N_TRIALS))
	{
	  rfwrite();
	  delay(20);  // This delay also seems necessary
	  TX_counter++;
	}

  //      if (payload_nodeID == TX_payload.supplyV) rfwrite();
      return str.buf;
    }
  else
    return NULL;
}

void writeOne() 
{
  //digitalWrite(ledPin, HIGH);
  digitalWrite(outputRFTxPin, HIGH);
  delayMicroseconds(580);
  digitalWrite(outputRFTxPin, LOW);
  delayMicroseconds(195);
}
void writeZero() 
{
  //digitalWrite(ledPin, LOW);
  digitalWrite(outputRFTxPin, HIGH);
  delayMicroseconds(195);
  digitalWrite(outputRFTxPin, LOW);
  delayMicroseconds(580);
}

/* void writeln(char *str,int count) */
/* { */
/* //  for (char i = 0; i < SEQ_LEN-1; i++)  */
/*   for (char i = 0; i < count; i++)  */
/*     Serial.print(str[i]); */
/*   Serial.println(); */
/* } */

void TXSequence(char *seq,int len) 
{
  for (char i = 0; i < len; i++) 
    {     
      if (seq[i] == '1') writeOne();     
      else writeZero();   
      //Serial.print(seq[i]);
    } 
    //Serial.println();
  //Set the LED off
  //digitalWrite(ledPin, LOW);
  // Set the output pin to high impedence state
  digitalWrite(outputRFTxPin, LOW);
  //  writeZero();
} 

void serialEvent() 
{   
  while (Serial.available()) 
    {       
      if (seqReady == 0) 
	{  
	  cmdStr[serialCount] = (char)Serial.read(); 
	  serialCount++;   
          //Serial.print(cmdStr);
	  //if (serialCount >= SEQ_LEN) seqReady = 1;
	  if (cmdStr[serialCount-1] == '\n') seqReady=1;//serialCount = 0;
	}
    }
}

float readTemperature()                     // run over and over again
{
  //initGPIO();
 //getting the voltage reading from the temperature sensor
  int reading=0;
  for(int i=0; i<10;i++)
    reading += analogRead(sensorTMP36Pin);  
  reading /= 10.0;
 //delay(10);
 //reading = analogRead(sensorTMP36Pin);  
 //delay(10);
 
 // converting that reading to voltage, for 3.3v arduino use 3.3
 float voltage = reading *5.0;
 voltage /= 1024.0; 
 
 // print out the voltage
 // Serial.print(voltage); Serial.println(" volts");
 
 // now print out the temperature
 float temperatureC = (voltage - 0.5) * 100 ;  //converting from 10 mv per degree wit 500 mV offset
                                               //to degrees ((voltage - 500mV) times 100)
 //Serial.print(temperatureC); Serial.println(" degrees C");
 
 // now convert to Fahrenheit
 // float temperatureF = (temperatureC * 9.0 / 5.0) + 32.0;
 // Serial.print(temperatureF); Serial.println(" degrees F");
 
 // delay(5000);                                     //waiting a second
 return temperatureC;
}
