/* -*-C++-*- */
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
//              NODEID CMD        PARAM1 PARAM0
//    Byte No.    1     0            1     0
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
#include <Queue.h>
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
#define TX_CMD_Q_LEN 5
byte listenerNodeIDList[N_LISTENERS]={15,16};
//####################################################################
//Data Structure to be received 
//####################################################################
typedef struct
{
  int rx1;		    // received value
  int supplyV;              // payload voltage
} Payload;

static Queue<Payload> TX_payload_q[N_LISTENERS] = Queue<Payload>(TX_CMD_Q_LEN);
static Payload payload;//, TX_payload[N_LISTENERS][TX_CMD_Q_LEN];
static byte rssi2, rssi1, rssiMantisa;
static byte TX_counter[N_LISTENERS];
#define SET_CMD(p,v)      (p.supplyV = setByte(p.supplyV,v,1))
#define SET_NODEID(p,v)   (p.supplyV = setByte(p.supplyV,v,0))
#define SET_PORT(p,v)     (p.rx1 = setByte(p.rx1,v,1))
#define SET_TIMEOUT(p,v)  (p.rx1 = setByte(p.rx1,v,0))

#define GET_CMD(p)      (getByte(p.supplyV,1))
#define GET_NODEID(p)   (getByte(p.supplyV,0))
#define GET_PORT(p)     (getByte(p.rx1,1))
#define GET_TIMEOUT(p)  (getByte(p.rx1,0))

// Disable the front of the cmd queue for the nth listener.  This is done by pop'ing the
// queue if it is not empty and setting the TX retry counter to the max. re-trial value.
#define DISABLE_TXPKT(n) {						\
    if (!TX_payload_q[n].isEmpty()) TX_payload_q[n].pop();		\
    TX_counter[n]=N_TRIALS+1;						\
  }
#define ENABLE_TXPKT(n)  (TX_counter[n]=0) // Set the counter to zero, indicating that the TX pkt. needs is ready to be sent
#define TXPKT_ENABLED(n)  (TX_counter[n] < N_TRIALS) // Check if TX counter is less than max. allowed trials

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
unsigned long lastPktSent[N_LISTENERS], lastPktRecvd=0;

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
  for (byte i=0;i<N_LISTENERS;i++)
    {
      initTXPkt(i);
      TX_counter[i]=N_TRIALS+1;
      //      DISABLE_TXPKT(i);  
    }
  str.reset();            // Reset json string       

  // for (int i=0;i<N_LISTENERS;i++)
  //     TX_counter[i]=N_TRIALS+1;
}
//####################################################################
void loop() 
{
  if ((millis() - lastPktRecvd) > 10000)
    {
      Serial.println("{\"rf_fail\":1,\"source\":\"Init RFM\",\"node\": 0 }\0");
      rf12_initialize(MYNODE, freq,group,1600 /*freqOffset*/);
      lastPktRecvd=millis();
    }
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
	  
	  // RFM_SEND     NODEID  CMD  PORT TIMEOUT
	  //                 supplyV      rx1
	  char *token; char s[2] = " ";const char *D="%d";
	  int v; byte n;
	  // NODIED
	  token=strtok(cmdStr+9, s);
	  sscanf(token,D,&v);  n=v;
	  n=inList(v,listenerNodeIDList);
	  if (n < N_LISTENERS)
	    {
	      Payload P;
	      P.supplyV=P.rx1=0;
	      SET_NODEID(P,v);
	      //TX_payload.rx1=v;  // The target node ID
	  
	      // CMD
	      token=strtok(NULL,s);
	      sscanf(token,D,&v);
	      SET_CMD(P,v);
	      //TX_payload.supplyV=v;  // The command

	      // PORT
	      token=strtok(NULL, s);
	      sscanf(token,D,&v);
	      SET_PORT(P,v);

	      // TIMEOUT
	      token=strtok(NULL, s);
	      sscanf(token,D,&v);
	      SET_TIMEOUT(P,v);

	      // If the front of the queue has the NOOP packet, remove it.
	      if (!TX_payload_q[n].isEmpty() && GET_CMD(TX_payload_q[n].peek()) == NOOP) 
		TX_payload_q[n].pop();
	      TX_payload_q[n].push(P);

	      // This is a debugging message printed as a JSON string on
	      // the serial port with rf_fail:1 so that the server
	      // listening on the serial port need not process it further.
	      Serial.println("{\"rf_fail\":1,\"source\":\"Got RFM_SEND\",\"cmd\":"+String(GET_CMD(P))
			     +(",\"rx1\":")+String(P.rx1)+s
			     +(",\"node\":") + String(GET_NODEID(P))+s
			     +(",\"param0\":") + String(GET_PORT(P))+s
			     +(",\"param1\":") + ("\"") + String(GET_TIMEOUT(P))+" " +String(TX_counter[n])+("\" }\0"));
	    }
	  else
	    Serial.println("{\"rf_fail\":1,\"source\":\"ERROR RFM_SEND\",\"node\":"+String(v)+(" }\0"));
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
      // Sim code
      /* else if (strncmp(cmdStr, "GETR",4)==0) */
      /* 	{ */
      /* 	  char *msg=NULL; */
      /* 	  while ((msg = readRFM69())==NULL); */
      /* 	  Serial.println(msg); */
      /* 	} */
      // Sim code
      // else if (strncmp(cmdStr, "RF12",4)==0)
      // 	{
      // 	  char *token; char s[2] = " ";const char *D="%d";
      // 	  int v; byte n;

      // 	  token=strtok(cmdStr+5, s);
      // 	  sscanf(token,D,&v);  n=v;

      // 	  SET_NODEID(RF12_DATA,v);
      // 	  RX_NODEID=v;

      // 	  token=strtok(NULL,s);
      // 	  sscanf(token,D,&v);
      // 	  SET_CMD(RF12_DATA,v);
      // 	  SET_PORT(RF12_DATA, 1);
      // 	  RF12_RECVDONE=true;
      // 	}
      // Reset the command string
      seqReady = 0;
      serialCount = 0;
      cmdStr[0]='\0';
    }
  else  
    {
      char *msg=NULL;
      //
      // The RFM_SEND switch above loads the RFM_SEND command in
      // TX_payload queue.  readRFM69() call below is the one which
      // should POP out the payload from TX_payload (it's a 2D array),
      if ((msg = readRFM69())!=NULL)
        {
	  Serial.println(msg);
          str.reset();
	  lastPktRecvd = millis();
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
static byte inList(const int& val,const byte list[])
{
  byte i;
  for (i=0; i<N_LISTENERS; i++)
    if (list[i] == val) break;
  return i;
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
//
// A single call to rf12_sendStart()/rf12_sendWait() combo seems
// required immediately after rf12_recvDone() via rf12_canSend()
// polling.  Multiple calls to rf12_sendStart()/rf12_sendWait() seems
// to make the RFM69CW unstable. I.e. it freezes, sometime after a few
// days or operation, after which it does not receive *any* packets
// from *any* of the nodes.  It **may** be capable of transmitting,
// but I haven't confirmed that.  
//
// From what I can understand of the driver's FSM, rf12_sendStart()
// will turn the radio into TX mode and keep it in that state till
// sending is finished. rf12_sendWait(), I think, will wait till the
// sending is finished.  And in this state, any RX packets will be
// ignored (lost).  Since the driver's packet buffer is shared between
// TX and RX states, the TX state should be entered only if there is
// no received packets in the packet buffer.  This condition is
// ensured via the "while(!rf12_canSend()) rf12_recvDone();" polling
// loop.
//
// rf12_sendWait(1) is the only one that works for "standard" fuses
// used on ATT84/88 when programmed with TinyCore using Arduino IDE
// ("Arduino as ISP").  Values of 2 or 3 as the argument would work
// for ATmega (?) and requires special fuses, etc.  Probably also not
// worth the effort given that this code runs on the wall-powered,
// always-on BaseStation unit.  This kind of BaseStation is
// fundamental part of RF network of remote nodes, some of which are
// TX-only and others are RX-TX nodes.
//
// A good resource for understanding, in some detail, the FSM is the
// "Inside the RF12 Driver" series via the following link:
// https://jeelabs.org/2011/12/10/inside-the-rf12-driver/ 
//
//                                            --SB (July 4th., 2019)
//
// ---------------------------------------------
static void rfwrite(const Payload& P)
{
  {
    //rf12_sleep(-1);     //wake up RF module
    while (!rf12_canSend()) rf12_recvDone();
    rf12_sendStart(0, &P, sizeof P);
    rf12_sendWait(1);    //wait for RF to finish sending while in IDLE (1) mode (standby is 2 -- does not work with JeeLib 2018)
    // rf12_sendStart(0, &P, sizeof P);
    // rf12_sendWait(1);    //wait for RF to finish sending while in IDLE (1) mode (standby is 2 -- does not work with JeeLib 2018)
    // //       rf12_sleep(0);    //put RF module to sleep
  }
}
//####################################################################
static void initTXPkt(const byte& n)
{
  Payload P;
  P.supplyV=0;
  SET_NODEID(P,listenerNodeIDList[n]);
  SET_CMD(P,NOOP);
  SET_PORT(P,0);
  SET_TIMEOUT(P,0);
  TX_payload_q[n].push(P);
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
static void printJSON(const byte& counterVal,const Payload& P)
{
  Serial.println("{\"rf_fail\":1,\"source\":\"Sending RFM_SEND\""
		 ",\"cmd\":"+String(GET_CMD(P))
		 +(",\"node\":") + String(GET_NODEID(P))+(" ")
		 +(",\"param0\":") + String(GET_PORT(P))+(" ")
		 +(",\"param1\":") + ("\"") + String(GET_TIMEOUT(P))+(" ")
		 +String(counterVal)+("\" }\0")); 
}
//####################################################################
static bool processACK(const int rx_nodeID, const int rx_rx, const int rx_supplyV, const byte& n)
{
  // Following logic determines if a packet is ACK packet:
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
  //  n = inList(rx_nodeID, listenerNodeIDList);
  Payload P = TX_payload_q[n].peek();

  if ((n < N_LISTENERS)  && (rx_nodeID == GET_NODEID(P)) && (rx_rx == P.rx1))
    {
      Serial.println("{\"rf_fail\":1,\"source\":\"ACKpkt:\",\"cmd\":"+String(GET_CMD(P))
		     +(",\"node\":") + String(GET_NODEID(P))
		     +(",\"p0\": ")+String(getByte(rx_rx,1))
		     +(",\"p1\": ")+String(rx_nodeID)+(" }\0")); 
      DISABLE_TXPKT(n);
      return true;
    }
  else // Current payload is not an ACK packet
    {
      // Save JSON string in global str object
      makeJSON(rx_nodeID);
      return false;
    }
}
//###################################################################################
// Macros used on packets from RF12/RFM69CW
//###################################################################################
#define RX_CRC_OK()  ((rf12_crc == 0))
#define RX_HDR_OK()  (((rf12_hdr & RF12_HDR_CTL) == 0))
#define RX_NODEID()  ((rf12_hdr & 0x1F))

static char* readRFM69()
{
  int payload_nodeID=NOTHING_TO_SEND;
  bool isACK=false;
  byte listenerNdx=N_LISTENERS;
  Payload P;

  if (rf12_recvDone())
    {
      if (RX_CRC_OK() && RX_HDR_OK()) // Is the payload valid?
	{
	  payload_nodeID = RX_NODEID();   // Extract node ID from the received packet
	  payload=*(Payload*) rf12_data;  // Get the payload

	  listenerNdx = inList(payload_nodeID, listenerNodeIDList);
	  // If the queue is empty, add a NOOP packet.
	  if (TX_payload_q[listenerNdx].isEmpty()) initTXPkt(listenerNdx);

	  // Determine if this is an ACK packet and return the index
	  // of the listener in the global listenerNodeIDList array
	  isACK=processACK(payload_nodeID, payload.rx1, payload.supplyV,listenerNdx);
	}
      
      if (!isACK && (listenerNdx<N_LISTENERS))
	{
	  // Prepare the Tx payload, enable it for Tx and start a
	  // timer for re-transmission cadence.
	  ENABLE_TXPKT(listenerNdx);
	  lastPktSent[listenerNdx]=millis();
	}
    }
  // Transmit the Tx payload if the number of trials is not exhausted
  // and the timer meets the re-transmission cadence.  Update the
  // timer and the number of re-transmissions.
  for (listenerNdx=0;listenerNdx<N_LISTENERS;listenerNdx++)
    if (TXPKT_ENABLED(listenerNdx) && (millis() - lastPktSent[listenerNdx] > 200))
      {
	  P=TX_payload_q[listenerNdx].peek(); 

	  printJSON(TX_counter[listenerNdx],P);
	  rfwrite(P); // Trasmit the global TX_payload
	  lastPktSent[listenerNdx] = millis();
	  TX_counter[listenerNdx]++;
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
          //Serial.println(cmdStr);
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
