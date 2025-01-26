#
#Arduino (UNO in this case) related code lives here.
#
class comPortSim:
    '''
    Object to manage USB-serial connection to Arduino (UNO).
    '''
    def __init__(self, port='/dev/ttyACM0', baudrate=19200):
        print ("comPortSim._init__");

    def getSerial(self):
        print ("comPortSim.getSerial");

    def open(self):
        print ("comPortSim.open");
        
    def close(self):
        print ("comPortSim.close");

    def send(self,str):
        print ("comPortSim.send: "+str);

    def read(self,errors='ignore'):
        print ("comPortSim.read");

    def readline(self,errors='ignore'):
        print ("comPortSim.readline");
