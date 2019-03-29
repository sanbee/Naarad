/// @dir RF12tune3
/// This sketch loads a configuration into eeprom compatible with rf12_config.
/// It then enters a frequency scanning mode to find the
/// centre of frequency offset from its partner ack'ing Jeenode.
/// The eeprom contents are then updated such that rf12_config will pick up
/// the centre frequency of the acknowledging node as its operational frequency.
/// 2013-10-04 <john<AT>o-hare<DOT>net> http://opensource.org/licenses/mit-license.php
////
const char NodeConfiguration[] PROGMEM = 
   "1700o 8b 209g 31i RF12Tune3";
////0....5....10...5....20...5....30...5....40...5....50...5....60..

/// Preserve eeprom settings during programming phase.
/// Recommended fuse settings for T84:
/// lfuse reads as C2
/// hfuse reads as D7
/// efuse reads as FF

#include <JeeLib.h>
#include <util/crc16.h>
#include <avr/eeprom.h>
#define ACK_TIME   50  // number of milliseconds to wait for an ack
#define RETRY_LIMIT 5  // maximum number of times to retry
#define RADIO_SYNC_MODE 2
#define SCAN_WIDTH 30

/// @details
/// eeprom layout details
/// byte 0x00 Key storage for encryption algorithm
///      0x1F  note: can be overwritten if T84 is Node 15 or M328 is Node 31
/// ------------------------------------------------------------------------
/// byte 0x20 Node number in bits                   ***n nnnn                    // 1 - 31
///           Collect mode flag                     **0* ****   COLLECT 0x20     // Pass incoming without sending acks
///           Band                                  00** ****   Do not use       // Will hang the hardware
///             "                                   01** ****   433MHZ  0x40
///             "                                   10** ****   868MHZ  0x80
///             "                                   11** ****   915MHZ  0xC0
/// --------------------------------------------------------------------------------------------------------------------------
/// byte 0x021 Group number                                11010100    // i.e. 212 0xD4
/// byte 0x022 Flag Spares                                 11** ****   // Perhaps we could store the output in hex flag here
///            V10 indicator                               **1* ****   // This bit is set by versions of RF12Demo less than 11
///            Quiet mode                                  ***1 ****   // don't report bad packets
///            Frequency offset most significant bite      **** nnnn   // Can't treat as a 12 bit integer
/// byte 0x023 Frequency offset less significant bits      nnnn nnnn   //  because of little endian constraint
/// byte 0x024 Text description generate by RF12Demo       "T i20 g0 @868.0000 MHz"
///      0x03D   "                                         Padded at the end with NUL
/// byte 0x03E  CRC                                        CRC of values with offset 0x20
/// byte 0x03F   "                                         through to end of Text string, except NUL's
/// byte 0x040 Node 1 first packet capture
///      0x059   "
/// byte 0x060 Node 2 first packet capture
///      0x079   "
///      ..... 
///      0x1E0 Node 14 first packet capture      T84 maximum
///      0x1FF   "
///      .....
///      0x3E0 Node 30 first packet capture      M328 maximum
///      0x3FF   "
/// --------------------------------------------------------------------------------------------------------------------------
/// Useful url: http://blog.strobotics.com.au/2009/07/27/rfm12-tutorial-part-3a/
//
volatile unsigned long int_count;
// RF12 configuration setup code
typedef struct {
  byte nodeId;
  byte group;
  int ee_frequency_hi : 4;  // Can't use as a 12 bit integer because of how they are stored in a structure.
  boolean flags : 4;
  int ee_frequency_lo : 8;  //
  char msg[RF12_EEPROM_SIZE-6];
  word crc;
} RF12Config;
//
static RF12Config config;
unsigned int frequency_offset;

#if defined(__AVR_ATtiny84__) || defined(__AVR_ATtiny44__)
#define SERIAL_BAUD 9600
/// Serial support (output only) for Tiny supported by TinyDebugSerial
/// http://www.ernstc.dk/arduino/tinycom.html
/// 9600, 38400, or 115200
/// Connect Tiny85 PB0 to USB-BUB RXD
#else
#define SERIAL_BAUD 57600
#endif

byte h, w, command, enough = 0, loc = 0, newNodeId;
unsigned int value = 0;
byte parameters = 0;

void setup() {
  Serial.begin(SERIAL_BAUD);
  showString(PSTR("\n[RF12tune3.0]\n"));
  delay(5000);  // Startup delay to debounce disconnection
  while (!enough) {
    command = getCmd();
    switch (command) {
      default:
      for (byte i = 0; i < sizeof config.msg; i++ ) {
        config.msg[i] = getString(NodeConfiguration, (loc + i));
        if (config.msg[i] == 0) {    // End of string?
          parameters = parameters | 0x01;
          enough = 1;
          break;
        }
      }
      break;
      case 'b': // set band: 4 = 433, 8 = 868, 9 = 915
      value = bandToFreq(value);
      if (value) {
        config.nodeId = (value << 6) + (config.nodeId & 0x3F);
      }
      parameters = parameters | 0x02;
      break;
      case 'g': // set network group
      config.group = value;
      parameters = parameters | 0x04;
      break;
      case 'i': // set node id
      if ((value > 0) && (value < 32)) {
        config.nodeId = (config.nodeId & 0xE0) + (value & 0x1F);
      }
      parameters = parameters | 0x08;
      break;
      case 'o': // Set frequency offset within band
      if ((value > (96 + SCAN_WIDTH )) && (value < (3903 - SCAN_WIDTH))) {  // 96 - 3903 is the range of values supported by the RFM12B
         frequency_offset = value;
      }
      parameters = parameters | 0x10;
      break;
    }
    loc++;
  }

  if (parameters != 0x1F) {
    showString(PSTR("Insufficient parameters 0x"));
    showNibble(0x1F - parameters >> 4);
    showNibble(0x1F - parameters);
    Serial.println();
    Serial.println(config.group);
    Serial.println(config.nodeId);
    Serial.println(frequency_offset);
    while(1) // Nothing more
      delay(32767);
  }

  setEEProm();  
}

static byte getCmd() {
  value = 0;
  for (byte i = 0;; ++i ) {
    char c = getString(NodeConfiguration, (loc + i));
    if (c == 0) enough = 1;         // Null, premature end of string
    if (c != 32) {                  // Space
      if ((c < 48) || (c > 57)) {   // 0 - 9
        loc = loc + i;        
        return c;
      }
      else {
       value = ((value * 10) + (c & 0x0F));
      }  
    }
  }
}
static byte bandToFreq (byte band) {
   return band == 4 ? RF12_433MHZ : band == 8 ? RF12_868MHZ : band == 9 ? RF12_915MHZ : 0;
}

void loop() {
  unsigned int scan, upLow, upHigh, downLow, downHigh;
  showString(PSTR("Scanning up started "));
  Serial.print(frequency_offset);
  showString(PSTR(" +/- "));
  Serial.println(SCAN_WIDTH);

    upLow = 0xFFFF;
    upHigh = 0;
    newNodeId=0;
  for (scan = (frequency_offset - SCAN_WIDTH); scan < (frequency_offset + SCAN_WIDTH); ++scan)
  {
   rf12_control(0xA000 + scan); 
   byte good = probe();
   if (good){
     if (scan > upHigh) upHigh = scan;
     if (scan < upLow) upLow = scan;
     if (good != 1) {
       showString(PSTR("\nGood "));
       Serial.print(int(good));
       showString(PSTR(" "));
       Serial.println(int(scan));
     }
     delay(50); 
   }
   else {
     showString(PSTR("No Ack "));
     Serial.print(scan);
     showString(PSTR("\r"));
     delay(50); 
   }
  }
  
  Serial.print("\n");
  Serial.print(int(upLow));
  Serial.print(" ");
  Serial.println(int(upHigh));
  
  if ((upHigh == 0) || (upLow == 0xFFFF)) return;  // If nobody answers then restart loop
  showString(PSTR("Scan up complete "));
  Serial.print(upLow);
  showString(PSTR("-"));
  Serial.println(upHigh);
  delay(50);
  downLow = 0xFFFF; 
  downHigh = 0;
  showString(PSTR("Scanning down started "));
  Serial.print(frequency_offset);
  showString(PSTR(" +/- "));
  Serial.println(SCAN_WIDTH);
  for (scan = (frequency_offset + SCAN_WIDTH); scan > (frequency_offset - SCAN_WIDTH); --scan)
  {
   rf12_control(0xA000 + scan); 
   byte good = probe();
   if (good){
     if (scan > downHigh) downHigh = scan;
     if (scan < downLow) downLow = scan;
     if (good != 1) {
       showString(PSTR("\nGood "));
       Serial.print(int(good));
       showString(PSTR(" "));
       Serial.println(int(scan));
     }
     delay(50); 
   }
   else {
     showString(PSTR("No Ack "));
     Serial.print(scan); 
     showString(PSTR("\r"));
     delay(50);
   }
  }
  
  Serial.print("\n");
  Serial.print(int(downLow));
  Serial.print(" ");
  Serial.println(int(downHigh));
  
  if ((downHigh == 0) || (downLow == 0xFFFF)) return;  // If nobody answers then restart loop
  showString(PSTR("Scan down complete "));
  Serial.print(downLow);
  showString(PSTR("-"));
  Serial.println(downHigh);
        
 frequency_offset = ( ((upLow + downLow) / 2) + ((((upHigh + downHigh) / 2) - ((upLow + downLow)/ 2)) / 2)   );
  showString(PSTR("Centre frequency offset is "));
  Serial.println(frequency_offset);
  delay(50);
  if (newNodeId) {
    config.nodeId = (config.nodeId & 0xE0) + (newNodeId & 0x1F);
    showString(PSTR("\rNew Node Number is "));
    Serial.println(int(newNodeId));
    delay(10);
  }
  setEEProm();
  Serial.println(int_count);
  Serial.println("Delaying 32,767");
  delay(32767);
/*  /// Lets take a look at the calibration of the oscillator we are using
  rf12_control(0xC009); // Set up to output a 1MHz clock from RFM12B
  rf12_control(0x80E7); // Turn off receiver and enable the clock
#if defined(__AVR_ATtiny84__) || defined(__AVR_ATtiny44__)
  PCMSK0 |= (1<<PCINT0);  // tell pin change mask to listen to PB0
  GIMSK  |= (1<<PCIE0);   // enable PCINT interrupt in the general interrupt mask
#else
#endif
  pinMode(10, INPUT);                // PA0
  digitalWrite(10, HIGH);  // pullup!

  while(1) // Nothing more
  { 
    int_count = 0;
    delay(1000);
    Serial.println(int_count);
  }
*/
} // Loop
/*
ISR (PCINT1_vect) { 
} 
ISR (PCINT0_vect) {
  int_count++;
} 
*/

static byte getString (PGM_P s, byte i) {
    char c = pgm_read_byte(s + i);
    return c;
}
static void showString (PGM_P s) {
  for (;;) {
    char c = pgm_read_byte(s++);
    if (c == 0)
      break;
    if (c == '\n')
      Serial.print('\r');
    Serial.print(c);
  }
}
static void setEEProm()
  {
   config.ee_frequency_hi = frequency_offset >> 8;
   config.ee_frequency_lo = frequency_offset & 0x00FF;

    config.crc = ~0;
    for (byte i = 0; i < sizeof config - 2; ++i)
      config.crc = _crc16_update(config.crc, ((byte*) &config)[i]);
    // save to EEPROM
    for (byte i = 0; i < sizeof config; ++i) {
      byte b = ((byte*) &config)[i];
      eeprom_write_byte(RF12_EEPROM_ADDR + i, b);
      showNibble(b >> 4);
      showNibble(b);
    }
    showString(PSTR("\n"));
    delay(50);
    if (!rf12_config()) {
      showString(PSTR("Config save failed"));
    }
    else {
      delay(50);
      byte good = probe(); // Transmit settings
    }
    delay(50);    
  }
static byte probe() 
  {
      for (byte i = 1; i < (RETRY_LIMIT+1); ++i) 
      {
        while (!rf12_canSend())
        rf12_recvDone();
        rf12_sendStart(RF12_HDR_ACK, &config, sizeof config, RADIO_SYNC_MODE);
        byte acked = waitForAck();
        if (acked) {
          if ((rf12_len == 1) && ((rf12_data[0] & 0xE0) == 0xE0)) { 
            if (!newNodeId) {
              newNodeId = rf12_data[0] & ~0xE0;
              showString(PSTR("Node Allocation "));
              Serial.println(int(newNodeId));
            }
          }
          return i; // Return number of attempts to successfully transmit
        }
      }
    return 0;
  }

// wait a few milliseconds for proper ACK to me, return true if indeed received
static byte waitForAck() {
    MilliTimer ackTimer;
    while (!ackTimer.poll(ACK_TIME)) {
        if (rf12_recvDone() && rf12_crc == 0 &&
                // see http://talk.jeelabs.net/topic/811#post-4712
              rf12_hdr == (RF12_HDR_DST | RF12_HDR_CTL | (config.nodeId & 0x1F))) {
              showString(PSTR("Ack "));
              Serial.print(int((ACK_TIME - ackTimer.remaining())));
              showString(PSTR("ms  \r"));
             return 1;
              }
    }
    return 0;
}
/// showNibble code below pinched from RF12Demo 2013-09-22
static void showNibble (byte nibble) {
  char c = '0' + (nibble & 0x0F);
  if (c > '9')
    c += 7;
  Serial.print(c);
}


