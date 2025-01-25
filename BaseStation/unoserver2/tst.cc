#include <iostream>
#include <stdio.h>
using namespace std;
inline static short int getNibble(short int target, short int which)
{
  return (target >> (which*8)) & (0xFF);
}
static short int setByte(short int word, short int nibble, short int whichByte)
{
  short int shift = whichByte * 8;
  return (word & ~(0xFF << shift)) | (nibble << shift);
}
#define GET_CMD(p)      (getNibble(p.supplyV,1))
#define SET_CMD(p,v)    (p.supplyV = setByte(p.supplyV,v,1))

typedef struct
{
  int temp;	// Temperature reading: re-used for receiving cmd
  int supplyV;	// Supply voltage; re-used for receiving target nodeID
 } Payload;

int main(int argc, char **argv)
{
  Payload p;
  unsigned int v;
  cout << "Value: ";
  cin >> v;
  p.temp=SET_CMD(p,v);
  unsigned long t0;
  t0 = GET_CMD(p)*60*1000;
  cerr << GET_CMD(p) << " " << t0 << endl;
  
}
