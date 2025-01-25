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

int main(int argc, char** argv)
{
  short int port,to,val;
  std::cin >> port >> to;

  val=setByte(val, port,1);
  val=setByte(val, to,0);
    
  cerr << val << " " << port << " " << to << endl;
  cerr << getNibble(val,0) << " " << getNibble(val,1) << endl;
  
}
