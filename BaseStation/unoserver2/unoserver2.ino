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

#define outputRFTxPin  6
#define sensorTMP36Pin  0 //the analog pin the TMP36's Vout (sense) pin is connected to
char cmdStr[SEQ_LEN];
char seqReady = 0;
char serialCount;

//####################################################################
//####################################################################
//####################################################################
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

#define LEDPIN 13
#define BAUDRATE 19200

#define DEBUG 

#define NOTHING_TO_SEND -1
#define N_TRIALS 5
#define N_LISTENERS 2
byte listenerNodeIDList[N_LISTENERS]={15,16};
//####################################################################
//Data Structure to be received 
//####################################################################
typedef struct
{
  int rx1;		    // received value
  int supplyV;              // payload voltage
} Payload;

static Payload payload, TX_payload;
static byte rssi2, rssi1, rssiMantisa;
static byte TX_counter=N_TRIALS+1;
#define SET_CMD(p,v)      (p.supplyV = setByte(p.supplyV,v,1))
#define SET_NODEID(p,v)   (p.supplyV = setByte(p.supplyV,v,0))
#define SET_PORT(p,v)     (p.rx1 = setByte(p.rx1,v,1))
#define SET_TIMEOUT(p,v)  (p.rx1 = setByte(p.rx1,v,0))

#define GET_CMD(p)      (getByte(p.supplyV,1))
#define GET_NODEID(p)   (getByte(p.supplyV,0))
#define GET_PORT(p)     (getByte(p.rx1,1))
#define GET_TIMEOUT(p)  (getByte(p.rx1,0))

#define INIT_TXPKT(p)  {p.supplyV=0;SET_CMD(p,NOOP);SET_PORT(p,0);SET_TIMEOUT(p,0);}//Set cmd to NOOP
#define DISABLE_TXPKT() (TX_counter=N_TRIALS+1) // Set the count to > allowed no. of trials
#define ENABLE_TXPKT()  (TX_counter=0) // Set the counter to zero, indicating that the TX pkt. needs is ready to be sent
#define TXPKT_ENABLED()  (TX_counter < N_TRIALS) // Check if TX counter is less than max. allowed trials

//####################################################################
// The PacketBuffer class is used to generate the json string that is
// send via ethernet - JeeLabs
//####################################################################
class PacketBuffer : public Print
{
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

//####################################################################
// Flow control varaiables
unsigned long lastPktSent;

//####################################################################
//####################################################################
//####################################################################

void setup() 
{
#ifdef DEBUG
  Serial.begin(BAUDRATE);
  Serial.println(F("Base Station: "));
  Serial.print(F(" Node: ")); Serial.print(MYNODE); 
  Serial.print(F(" Freq: ")); Serial.print(F("433MHz")); 
  Serial.print(F(" Network group: ")); Serial.println(group);
#if RF69_COMPAT
  Serial.println(F(" Working in RF69 Compatibility mode (RF12B Compat. mode actually)"));
#endif
#endif
  delay(10);
  rf12_initialize(MYNODE, freq,group,1600 /*freqOffset*/);
  
  initOOKRadio();
  Serial.println(F("Receiver ready"));
  
  // Set the node ID in the TX_payload to invalid value to indicate
  // that there is nothing to send yet.  Reset the re-try counter and
  // set the TX mode to OFF.
  INIT_TXPKT(TX_payload);
  DISABLE_TXPKT();        // TX_counter=N_TRIALS+1;
  str.reset();            // Reset json string       
}
//####################################################################
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
	  // Extract the value of the target node ID and the command
	  // to send from the cmdStr.  Set up the TX_payload to be
	  // sent when the server decides to transmit the payload.
	  
	  //Serial.println(cmdStr);
	  
	  TX_payload.supplyV=TX_payload.rx1=0;
	  // RFM_SEND    CMD NODEID      PORT TIMEOUT
	  //               supplyV          rx1
	  char *token; char s[2] = " ";const char *D="%d";
	  // CMD
	  token=strtok(cmdStr+9,s);
	  int v; sscanf(token,D,&v);  
	  SET_CMD(TX_payload,v);
	  //TX_payload.supplyV=v;  // The command
	  
	  // NODIED
	  token=strtok(NULL, s);
	  sscanf(token,D,&v); 
	  SET_NODEID(TX_payload,v);
	  //TX_payload.rx1=v;  // The target node ID
	  
	  // PORT
	  token=strtok(NULL, s);
	  sscanf(token,D,&v); 
	  SET_PORT(TX_payload,v);
	  
	  // TIMEOUT
	  token=strtok(NULL, s);
	  sscanf(token,D,&v); 
	  SET_TIMEOUT(TX_payload,v);
	  // This is a debugging message printed as a JSON string on
	  // the serial port with rf_fail:1 so that the server
	  // listening on the serial port need not process it further.
	  Serial.println("{\"rf_fail\":1,\"source\":\"Got RFM_SEND\",\"cmd\":"+String(GET_CMD(TX_payload))
			 +(",\"node\":") + String(GET_NODEID(TX_payload))+s
			 +(",\"port\":") + String(GET_PORT(TX_payload))+s
			 +(",\"TIMEOUT\":") + ("\"") + String(GET_TIMEOUT(TX_payload))+" " +String(TX_counter)+("\" }\0")); 
	}
      // Read a value from sensorTMP36PIN and return the value as
      // temperature in degC
      else if (strncmp(cmdStr, "GETT",4)==0)
	{
	  float val = readTemperature();
	  str.reset();
	  str.print(("{\"rf_fail\":0"));             // RF recieved so no failure
	  str.print((",\"degc\":"));   str.print(val); 
	  str.print((",\"node_id\":0"));
	  str.print((",\"source\":\"RS0\" }\0"));
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
        {
	  Serial.println(msg);
          str.reset();
        }
    }
}
//####################################################################
static void initOOKRadio() 
{
  pinMode(outputRFTxPin, OUTPUT);
  // Set the output pin to high impedence state
  digitalWrite(outputRFTxPin, LOW);
}
//####################################################################
static bool inList(const int& val,const byte list[])
{
  for (byte i=0; i<N_LISTENERS; i++)
    if (list[i] == val) return true;
  return false; 
}
//####################################################################
static short int getByte(short int target, short int which)
{
  return (target >> (which*8)) & (0xFF);
}
//####################################################################
static short int setByte(short int word, short int nibble, short int whichByte)
{
  short int shift = whichByte * 8;
  return (word & ~(0xFF << shift)) | (nibble << shift);
}
//####################################################################
//---------------------------------------------
// Send payload data via RF
//---------------------------------------------
static void rfwrite()
{
  //if (TX_payload.supplyV != NOTHING_TO_SEND)
  {
    //Serial.println("{\rf_fail:1, \"source\":\"rfwrite\"}\0");
    rf12_sleep(-1);     //wake up RF module
    while (!rf12_canSend()) rf12_recvDone();
    rf12_sendStart(0, &TX_payload, sizeof TX_payload); 
    rf12_sendWait(1);    //wait for RF to finish sending while in IDLE (1) mode (standby is 2 -- does not work with JeeLib 2018)
    rf12_sendStart(0, &TX_payload, sizeof TX_payload); 
    rf12_sendWait(1);    //wait for RF to finish sending while in IDLE (1) mode (standby is 2 -- does not work with JeeLib 2018)
    //       rf12_sleep(0);    //put RF module to sleep
  }
}
//####################################################################
static void makeJSON(const int& payload_nodeID)
{
  rssi2 = RF69::rssi;      rssi1 = rssi2>>1;
  rssiMantisa = rssi2-(rssi1<<1);
  str.print(("{\"rf_fail\":0,"));             // RF recieved so no failure
  str.print(("\"node_id\":")); str.print(payload_nodeID);   // Add node ID
  str.print((",\"degc\":"));   str.print(payload.rx1/100.0); // Add reading 
  str.print((",\"node_v\":")); str.print(payload.supplyV/1000.0); // Add tx battery voltage reading
  str.print((",\"node_p\":")); str.print(-(rssi1));// Add received power (in dB)
  //if (rssiMantisa) str.print(PSTR(".5"));  str.print((",\"source\":\"RS0\" }\0"));
  if (rssiMantisa) str.print(".5");  str.print((",\"source\":\"RS0\" }\0"));
}
//####################################################################
static void printJSON(const byte& counter)
{
  Serial.println("{\"rf_fail\":1,\"source\":\"Sending RFM_SEND\""
		 ",\"cmd\":"+String(GET_CMD(TX_payload))
		 +(",\"node\":") + String(GET_NODEID(TX_payload))+(" ")
		 +(",\"port\":") + String(GET_PORT(TX_payload))+(" ")
		 +(",\"TIMEOUT\":") + ("\"") + String(GET_TIMEOUT(TX_payload))+(" ")
		 +String(counter)+("\" }\0")); 
}
//####################################################################
static bool processACK(const int rx_nodeID, const int rx_rx, const int rx_supplyV)
{
  // An ACK packet is detected using the following logic:
  //
  //   1. If the nodeID from which the current packet was received is
  //      the same as the nodeID in the TX_payload (the target nodeID
  //      for the transmitted packet), and
  //
  //   2. If the rx1 value of the received packet has the same value
  //      as the rx1 value of the last transmitted packet
  //
  // The TX_payload is then disabled (no further re-transmissions are
  // required) and the command in it set to NOOP (the default command
  // sent in the absence of any RFM_SEND command received on the
  // serial port).
  //
  if ((rx_nodeID == GET_NODEID(TX_payload)) && (rx_rx == TX_payload.rx1))
    {
      Serial.println("{\"rf_fail\":1,\"source\":\"ACKpkt:\",\"cmd\":"+String(GET_CMD(TX_payload))
		     +(",\"node\":") + String(GET_NODEID(TX_payload))
		     +(",\"t2\": ")+String(rx_rx)
		     +(",\"t3\": ")+String(rx_nodeID)+(" }\0")); 
      SET_CMD(TX_payload,NOOP);
      DISABLE_TXPKT();
      return true;
    }
  else // Current payload is not an ACK packet
    {
      // Save JSON string in global str object
      makeJSON(rx_nodeID);
      return false;
    }
}
//####################################################################
// If a CMD is available for the nodeID, copy it to TX_payload.  This
// currently is a place-holder for copying TX payload from
// NodeID-based caches to global TX_payload
static void loadTxCmdForNode(const int& nodeID)
{
  SET_NODEID(TX_payload,nodeID);
  return;
}
//####################################################################
#define RX_CRC_OK()  ((rf12_crc == 0))
#define RX_HDR_OK()  (((rf12_hdr & RF12_HDR_CTL) == 0))
#define RX_NODEID()  ((rf12_hdr & 0x1F))

static char* readRFM69() 
{
  int payload_nodeID=NOTHING_TO_SEND;
  bool isACK=false;
  if (rf12_recvDone()) 
    {
      if (RX_CRC_OK() && RX_HDR_OK()) // Is the payload valid?
	{
	  payload_nodeID = RX_NODEID();   // Extract node ID from the received packet
	  payload=*(Payload*) rf12_data;  // Get the payload
	  isACK=processACK(payload_nodeID, payload.rx1, payload.supplyV);
	}
      
      if (!isACK && inList(payload_nodeID,listenerNodeIDList))
	{
	  // Prepare the Tx payload, enable it for Tx and start a
	  // timer for re-transmission cadence.
	  loadTxCmdForNode(payload_nodeID);
	  ENABLE_TXPKT();
	  lastPktSent=millis();
	}
    }
  // Transmit the Tx payload if the number of trials is not exhausted
  // and the timer meets the re-transmission cadence.  Update the
  // timer and the number of re-transmissions.
  if (TXPKT_ENABLED() && (millis() - lastPktSent > 200))
    {
      printJSON(TX_counter);
      rfwrite(); // Trasmit the global TX_payload
      lastPktSent = millis();
      TX_counter++;
    }
  return (str.fill==0)?NULL:str.buf;
}
//####################################################################
void writeOne() 
{
  //digitalWrite(ledPin, HIGH);
  digitalWrite(outputRFTxPin, HIGH);
  delayMicroseconds(580);
  digitalWrite(outputRFTxPin, LOW);
  delayMicroseconds(195);
}
//####################################################################
void writeZero() 
{
  //digitalWrite(ledPin, LOW);
  digitalWrite(outputRFTxPin, HIGH);
  delayMicroseconds(195);
  digitalWrite(outputRFTxPin, LOW);
  delayMicroseconds(580);
}
//####################################################################
/* void writeln(char *str,int count) */
/* { */
/* //  for (char i = 0; i < SEQ_LEN-1; i++)  */
/*   for (char i = 0; i < count; i++)  */
/*     Serial.print(str[i]); */
/*   Serial.println(); */
/* } */
//####################################################################
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
//####################################################################
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
//####################################################################
float readTemperature()   
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
