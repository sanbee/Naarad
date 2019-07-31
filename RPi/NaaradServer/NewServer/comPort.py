#
#Arduino (UNO in this case) related code lives here.
#
import serial as serial;
import threading;

class comPort:
    '''
    Object to manage USB-serial connection to Arduino (UNO).
    '''
    def __init__(self, port='/dev/ttyACM0', baudrate=19200):
        # self.com1 = serial.Serial(port =port,
        #                           baudrate = baudrate,
        #                           parity = serial.PARITY_NONE,
        #                           stopbits = serial.STOPBITS_ONE, 
        #                           bytesize = serial.EIGHTBITS);
        self.com1=serial.Serial();
        self.com1.port = port;
        self.com1.baudrate = baudrate;
        self.com1.bytesize=serial.EIGHTBITS; 
        self.com1.parity=serial.PARITY_NONE; 
        self.com1.stopbits=serial.STOPBITS_ONE;
        self.users=0;
        self.lock=threading.Lock();
        self.com1.timeout=10;
	self.SOF = '{';
        self.EOF = '}';

    def getSerial(self):
        return self.com1;

    def open(self):
        with self.lock:
            if (not self.com1.isOpen()):
                self.com1.open();
            self.users += 1;

    def close(self):
        with lock:
            if (self.com1.isOpen()):
                if (self.users > 0):
                    self.users -= 1;
                if (self.users==0):
                    self.com1.close();

    def send(self,str):
        self.com1.write((str+"\n").encode());

    def read(self,errors='ignore'):
        #return self.com1.read().decode(errors=errors);
        return self.com1.read().decode();

    def readline(self,errors='ignore'):
        #return self.com1.readline().decode(errors=errors);
        print("Waiting...");
        tt=self.com1.readline().decode();
        print("### "+str(tt));
        return tt;

    def myreadline(self):
        # FIND START OF FRAME
        sensor_data="";
        temp="";
        temp=self.com1.read().decode();
        if (temp==""):
            print("TO");
            return temp;

        while (temp != self.SOF):
            # print(temp,end='');
            #print('!'+temp);
            temp=self.com1.read().decode();

        # RECORD UNTIL END OF FRAME
        # print(temp,end='');
        while (temp != self.EOF):
            sensor_data += str(temp);
            temp = self.com1.read().decode();
            # print(temp,end='');

        sensor_data += str(temp);
        return sensor_data;

