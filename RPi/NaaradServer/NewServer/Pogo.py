import time;
from multiprocessing import Queue as Queue;

class Pogo:
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
        self.listeningfd.append(fd);
        print ("Pogo knows about these snooper IDs: ",self.listeningfd);

    def removeListeningPort(self,fd):
        self.listeningfd.remove(fd);
        print ("Pogo deleting a snooper.  Knows about: ",self.listeningfd);

    def sendCmd(self,cmd):
       if (self.serialCmdQ.qsize() == 0):
           self.serialCmdQ.put(cmd);
           print ("Negotiating with UNO. QSize=",self.serialCmdQ.qsize());
           if (cmd.strip() == "pogocmd"):
               self.val = self.getrtemp();
               tt=self.serialCmdQ.get();
               return self.val;
       else:
           print ("UNO negotiations in progress.  Serving from past memory...");
           return self.val;

    def loop(self):
        print (self.getrtemp());
        while 1:
            print (self.getrtemp());
            time.sleep(4);

    def getrtemp(self):
        self.pktRadio.getPort().getSerial().flushInput();
        self.pktRadio.getPort().getSerial().flushOutput();
        self.pktRadio.getPort().send("GETR");
        time.sleep(self.tau);
        val = self.pktRadio.readInput2().split('\n')[0];
        if (val != ""):
            # Add a time stamp and packet number
            #packetVal = time.asctime(time.localtime())+" "+str(self.pktNo)+" "+val;
            packetVal = str(time.time())+" "+str(self.pktNo)+" ",float(val);
            self.pktNo=self.pktNo+1;
            return packetVal.strip();

    def gettemp(self):
        self.pktRadio.getPort().getSerial().flushInput();
        self.pktRadio.getPort().getSerial().flushOutput();
        self.pktRadio.getPort().send("GETT");
        time.sleep(self.tau);

        # Following four lines are commented to check if
        # serversock4_ping can get the JSON packet produced in
        # unoserver?.ino due to "GETT" command sent to it
        #
        # val = self.pktRadio.readInput2();
        # time.sleep(self.tau);
        # print ("Pogo GETT:",val);
        # return val.strip();

        # val = self.pktRadio.readInput2().split('\n')[0];
        # if (val != ""):
        #     print (time.asctime(time.localtime())," ",self.pktNo," ",float(val));
        #     self.pktNo=self.pktNo+1;
    
    def tell(self,switch,turnon=True):
        self.ookRadio.tell(switch,turnon);
