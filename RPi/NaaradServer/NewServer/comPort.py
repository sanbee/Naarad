#
#Arduino (UNO in this case) related code lives here.
#
import serial as serial;

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

    def getSerial(self):
        return self.com1;

    def open(self):
        if (not self.com1.isOpen()):
            self.com1.open();
        self.users += 1;

    def close(self):
        if (self.com1.isOpen()):
            if (self.users > 0):
                self.users -= 1;
            if (self.users==0):
                self.com1.close();

    def send(self,str):
        self.com1.write((str+"\n").encode());

    def read(self,errors='ignore'):
        return self.com1.read().decode(errors=errors);

    def readline(self,errors='ignore'):
        return self.com1.readline().decode(errors=errors);
