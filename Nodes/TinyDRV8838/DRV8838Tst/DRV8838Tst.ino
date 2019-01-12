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
#include <avr/sleep.h>
#define adc_disable() (ADCSRA &= ~(1<<ADEN)) // disable ADC (before power-off)
#define adc_enable() (ADCSRA |= (1<<ADEN)) // re-enable ADC

#define CLOCK_DIV clock_div_8
#define DIVBY 8
//#define DELAY(n)  delay((int)((float)n/DIVBY))
#define DELAY(n)  delay(n)

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
void initPINS(void)
{
  pinMode(PIN_EN,OUTPUT);
  pinMode(PIN_PH,OUTPUT);
  pinMode(PINVCC,OUTPUT);

  digitalWrite(PINVCC, LOW);
  controlSolenoid(SHUT); 

  DELAY(100);
}
void disablePINS(void)
{
  for (int i=0;i<20;i++)
    {
      pinMode(i,INPUT);
      digitalWrite(i,LOW);
    }
}
// 
void setup(void) {
  // We'll send debugging information via the Serial monitor
  Serial.begin(9600);   
  disablePINS();
  initPINS();
}
void loop(void) {
  //power_adc_enable();
  initPINS();
  adc_enable();
  DELAY(5);
  digitalWrite(PINVCC, HIGH);
  DELAY(2000);

  controlSolenoid(SHUT);
  DELAY(500);
  {
    //controlSolenoid(CLOSE);
    //delay(20);
    //controlSolenoid(SHUT);

    CTRLSOLENOID(CLOSE);
  }

  // Wait for 10s before opening the valve
  DELAY(2000);

  {
    //controlSolenoid(OPEN);
    //delay(20);
    //controlSolenoid(SHUT);

    CTRLSOLENOID(OPEN);
  }
 
  DELAY(10000);

  {
    //controlSolenoid(CLOSE);
    //delay(20);
    //controlSolenoid(SHUT);

    CTRLSOLENOID(CLOSE);
  }
  // Wait for 10s before looping back...
  digitalWrite(PINVCC, LOW);
  controlSolenoid(SHUT);
  DELAY(5);

  disablePINS();

  //power_adc_disable();
  adc_disable();

  //PRR = 0xFF; // Power off mode
  // //======================================================TEST CODE
  // // Power-down board
  //set_sleep_mode(SLEEP_MODE_PWR_DOWN);
 
  // sleep_enable();
 
  // // Disable ADC
  // ADCSRA = 0;

  // // Power down functions
  //PRR = 0xFF;
 
  // // Enter sleep mod
  // //======================================================TEST CODE


  //  for(;;)  Sleepy::loseSomeTime(64000); //JeeLabs power save function: enter low power mode for 60 seconds (valid range 16-65000 ms)
  //  goToSleep();
  //clock_prescale_set (CLOCK_DIV);
  Sleepy::loseSomeTime(10000); //JeeLabs power save function: enter low power mode for 60 seconds (valid range 16-65000 ms)
}
void goToSleep ()
  {
  set_sleep_mode (SLEEP_MODE_PWR_DOWN);
  ADCSRA = 0;            // turn off ADC
  power_all_disable ();  // power off ADC, Timer 0 and 1, serial interface
  noInterrupts ();       // timed sequence coming up
  //resetWatchdog ();      // get watchdog ready
  sleep_enable ();       // ready to sleep
  interrupts ();         // interrupts are required now
  // sleep_cpu ();          // sleep                
  // sleep_disable ();      // precaution
  // power_all_enable ();   // power everything back on
  }  // end of goToSleep 

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

