from comPort import comPort;

c1=comPort(baudrate=9600);
c1.open();
while(True):
	xx=c1.getSerial().readline();
	print(xx);

