// -*- C++ -*-
/* Sketch to control L9110S->Solenoid
     
*/
   // The PacketBuffer class is used to generate the json string that is send via ethernet - JeeLabs
   //########################################################################################################################
//   class PacketBuffer : public Print {
//   public:
//       PacketBuffer () : fill (0) {}
//       const char* buffer() { return buf; }
//       byte length() { return fill; }
//       void reset() { fill = 0;}
//       virtual size_t write(uint8_t ch)
//           { if (fill < sizeof buf) buf[fill++] = ch; }  
//       void done() {for(int i=fill;i<sizeof(buf);i++) buf[i]='\0';};
//       byte fill;
//       char buf[150];
//       private:
//   };
// static PacketBuffer str;
// static int NODEID=2;
// static float VERSION=3.1;
#include <JeeLib.h> // https://github.com/jcw/jeelib
ISR(WDT_vect) { Sleepy::watchdogEvent(); } // interrupt handler for JeeLabs Sleepy power saving

#define CLOSE 0
#define OPEN 1
#define SHUT -1
#define adc_disable() (ADCSRA &= ~(1<<ADEN)) // disable ADC (before power-off)
#define adc_enable() (ADCSRA |= (1<<ADEN)) // re-enable ADC
//#include <avr/power.h>

#define CTRLSOLENOID(cmd)   {for(int i=0;i<5;i++) {controlSolenoid(cmd); delay(10);}controlSolenoid(SHUT);}

int PIN_BIN2 = PIN_A1; // Physical pin 12 - BIN2 (PH)
int PIN_BIN1 = PIN_A2; // Physical pin 11 - BIN1 (EN)
int PIN_SLP = PIN_A3; // Physical pin 10 - SLP
//
const void controlSolenoid(int dir)
{
  if (dir==OPEN)
    {
      digitalWrite(PIN_BIN1, HIGH);
      digitalWrite(PIN_BIN2, LOW);

      //Serial.println("OPEN");
    }
  else if (dir==CLOSE)
    {
      digitalWrite(PIN_BIN1, LOW);
      digitalWrite(PIN_BIN2, HIGH);
      
      //Serial.println("CLOSE");
    }
  else
    {
      digitalWrite(PIN_BIN1, LOW);
      digitalWrite(PIN_BIN2, LOW);

      //Serial.println("OFF");
    }
}
// 
void setup(void) {
  // We'll send debugging information via the Serial monitor
  Serial.begin(9600);   
  pinMode(PIN_BIN1,OUTPUT);
  pinMode(PIN_BIN2,OUTPUT);
  pinMode(PIN_SLP,OUTPUT);

  adc_enable(); 
  controlSolenoid(SHUT); delay(5);
  digitalWrite(PIN_SLP, LOW);  
  delay(100);
}
void loop(void) {
  digitalWrite(PIN_SLP, HIGH);  delay(5);

  CTRLSOLENOID(CLOSE);

  //  digitalWrite(PIN_SLP, LOW);  
  // Wait for 10s before opening the valve
  delay(2000);

  //  digitalWrite(PIN_SLP, LOW);  delay(5);

  CTRLSOLENOID(OPEN)

  delay(10000);

  CTRLSOLENOID(CLOSE);

  // Wait for 10s before looping back...
  delay(1000);
  digitalWrite(PIN_SLP, LOW);
  controlSolenoid(SHUT);
  delay(5000);
  adc_disable();//Claim is that with this, the current consumption is down to 0.2uA from 230uA (!)
  for(;;)  Sleepy::loseSomeTime(64000); //JeeLabs power save function: enter low power mode for 60 seconds (valid range 16-65000 ms)
}

// const char* makePacket(const float val, const char* name, const char* units)
// {
//   str.reset();
//   str.print("{\"rf_fail\":0");             // RF recieved so no failure
//   str.print(",\"version\":"); str.print(VERSION);
//   str.print(",\"node_id\":"); str.print(NODEID);
//   str.print(",\"name\":\"");str.print(name);str.print("\"");
//   str.print(",\"value\":"); str.print(val);
//   str.print(",\"unit\":\"");str.print(units);str.print("\"");
//   str.print(" }\0");
//   str.done();
//   return str.buf;
// }

