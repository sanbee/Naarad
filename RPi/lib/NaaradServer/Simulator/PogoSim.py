import time;
from multiprocessing import Queue as Queue;

class PogoSim:
    '''
    The top-level interface to sensor network (via PacketRadio on
    UNO), command center (via OOKRadio on UNO), sensors directly
    connected to UNO, etc.
    '''

    def __init__(self, packetradio, ookradio,tau=2.0):
        self.pktRadio = packetradio;
        self.ookRadio = ookradio;
        self.tau = tau;
        self.pktNo=0;
        self.listeningfd=[];
        #self.serialCmdQ=Queue.Queue(5);
        self.serialCmdQ=Queue(5);
        self.val="";

    def addListeningPort(self,fd):
          print ("Pogo knows about these snooper IDs: ",fd);

    def removeListeningPort(self,fd):
        print ("Pogo deleting a snooper.  Knows about: ",fd);

    def sendCmd(self,cmd):
        print ("PogoSim.sendCmd"+cmd);

    def getrtemp(self):
        print ("PogoSim.getrtemp");

    def gettemp(self):
        print ("PogoSim.gettemp");
        
    def tell(self,switch,turnon=True):
        print ("PogoSim.tell "+str(switch)+ " " + str(turnon));

