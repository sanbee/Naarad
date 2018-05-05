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

#define CLOSE 0
#define OPEN 1
#define SHUT -1

int DCNTL0 = PIN_A1; // Physical pin 12
int DCNTL1 = PIN_A2; // Physical pin 11
int PINVCC = PIN_A3; // Physical pin 10
//
const void controlSolenoid(int dir)
{
  if (dir==OPEN)
    {
      digitalWrite(DCNTL0, HIGH);
      digitalWrite(DCNTL1, LOW);

      //Serial.println("OPEN");
    }
  else if (dir==CLOSE)
    {
      digitalWrite(DCNTL0, LOW);
      digitalWrite(DCNTL1, HIGH);
      
      //Serial.println("CLOSE");
    }
  else
    {
      digitalWrite(DCNTL0, LOW);
      digitalWrite(DCNTL1, LOW);

      //Serial.println("OFF");
    }
}
// 
void setup(void) {
  // We'll send debugging information via the Serial monitor
  Serial.begin(9600);   
  pinMode(DCNTL0,OUTPUT);
  pinMode(DCNTL1,OUTPUT);
  pinMode(PINVCC,OUTPUT);

  controlSolenoid(SHUT); 
  delay(100);
}
void loop(void) {

  digitalWrite(PINVCC, HIGH);
  //controlSolenoid(SHUT);
  {
    controlSolenoid(CLOSE);
    delay(10);
    //controlSolenoid(SHUT);
  }
  // Wait for 10s before opening the valve
  delay(10000);
  {
    controlSolenoid(OPEN);
    delay(10);
    //controlSolenoid(SHUT);
  }
  // Wait for 10s before looping back...
  digitalWrite(PINVCC, LOW);
  delay(10000);
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

