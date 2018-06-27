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
#include <avr/power.h>

#define CLOSE 0
#define OPEN 1
#define SHUT -1

#define CTRLSOLENOID(cmd)   {for(int i=0;i<5;i++) {controlSolenoid(cmd); delay(12);controlSolenoid(SHUT);}}


int PIN_PH = PIN_A1; // Physical pin 12 - PH
int PIN_EN = PIN_A2; // Physical pin 11 - EN
int PINVCC = PIN_A3; // Physical pin 10
//
const void controlSolenoid(int dir)
{
  if (dir==OPEN)
    {
      digitalWrite(PIN_PH, HIGH);
      digitalWrite(PIN_EN, HIGH);

      //Serial.println("OPEN");
    }
  else if (dir==CLOSE)
    {
      digitalWrite(PIN_PH, LOW);
      digitalWrite(PIN_EN, HIGH);
      
      //Serial.println("CLOSE");
    }
  else
    {
      digitalWrite(PIN_PH, LOW);
      digitalWrite(PIN_EN, LOW);

      //Serial.println("OFF");
    }
}
// 
void setup(void) {
  // We'll send debugging information via the Serial monitor
  Serial.begin(9600);   
  pinMode(PIN_EN,OUTPUT);
  pinMode(PIN_PH,OUTPUT);
  //  pinMode(PIN_PH,INPUT);
  pinMode(PINVCC,OUTPUT);

  digitalWrite(PINVCC, LOW);

  controlSolenoid(SHUT); 
  delay(100);
}
void loop(void) {
  power_adc_enable();
  delay(5);
  digitalWrite(PINVCC, HIGH);
  delay(2000);  

  controlSolenoid(SHUT);
  delay(500);
  {
    //controlSolenoid(CLOSE);
    //delay(20);
    //controlSolenoid(SHUT);

    CTRLSOLENOID(CLOSE);
  }

  // Wait for 10s before opening the valve
  delay(2000);

  {
    //controlSolenoid(OPEN);
    //delay(20);
    //controlSolenoid(SHUT);

    CTRLSOLENOID(OPEN);
  }

  delay(10000);

  {
    //controlSolenoid(CLOSE);
    //delay(20);
    //controlSolenoid(SHUT);

    CTRLSOLENOID(CLOSE);
  }
  // Wait for 10s before looping back...
  digitalWrite(PINVCC, LOW);
  controlSolenoid(SHUT);
  delay(5);
  power_adc_disable();

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

