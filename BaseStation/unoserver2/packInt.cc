#include <stdio.h>
void showbits(short int x)
{
    int i; 
    for(i=(sizeof(x)*8)-1; i>=0; i--)
      {
	(x&(1u<<i))?putchar('1'):putchar('0');
	if (i%4==0) putchar(' ');
      }
    
    printf("\n");
}

void setnibble(short int& target, short int shift, short int val)
{
  target = (val << shift);
}
short int getnibble(short int target, short int which)
{
  return (target >> (which*8)) & (0xFF);
}

static short int setNibble(short int word, short int nibble, short int whichNibble)
{
  short int shift = whichNibble * 8;
  return (word & ~(0xf << shift)) | (nibble << shift);
}

int main(int argc, char** argv)
{
  short int buf=0,i, n=3,val0=15,val1=5;

  printf("sizeof(): %d\n",sizeof(buf));


  printf("Value being set: %d %d \n",val0,val1);
  buf=setNibble(buf, val0, 0);
  buf=setNibble(buf, val1, 1);
  showbits(buf);
  printf("%d\n",buf);

  printf("\nRecovered value and the bit pattern for recovery\n");
  printf("%d %d\n",getnibble(buf,0),getnibble(buf,1));
}
