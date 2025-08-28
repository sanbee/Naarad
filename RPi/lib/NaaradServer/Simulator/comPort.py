import time;
import json;
import random;
import threading;
#
# comPort simulation.
#
class comPort:
    '''
    Object to manage USB-serial connection to Arduino (UNO).
    '''
    def __init__(self, port='/dev/ttyACM0', baudrate=19200):
        self.pktID=0;
        self.users=0;
        self.lock=threading.Lock();
        print ("------------------");
        print ("comPortSim._init__");
        print ("------------------");

    def getSerial(self):
        print ("------------------");
        print ("comPortSim.getSerial");
        print ("------------------");

    def open(self):
        with self.lock:
            print ("------------------");
            print ("comPortSim.open");
            print ("------------------");
            self.users += 1;

    def close(self):
        with self.lock:
            if (self.users > 0):
                self.users -= 1;
            if (self.users <= 0):
                print ("------------------");
                print ("comPortSim.close");
                print ("------------------");

    def send(self,str):
        print ("comPortSim.send: "+str);

    def read(self,errors='ignore'):
        print ("comPortSim.read");

    def readline(self,errors='ignore'):
        try:
            self.pktID+=1;
            time.sleep(5);
            jdict={};
            jdict["rf_fail"]=0;
            node=1;
            if (self.pktID%5==0):
                node=3;
                jdict["rf_fail"]=1;
            jdict["node_id"] = node;
            jdict["degc"]    = 20.0+(random.random()-0.5)/2.0;
            jdict["node_p"]  = -30.0-random.random()*30.0;
            jdict["source"]="naaradsim";
            line =json.dumps(jdict);
            if (self.pktID==3):
                line="Three!";
            #
            # The following will simulate a com port read timeout in NaaradTopics2::run()
            # and should initiate an auto-reboot sequence
            #
            # if (self.pktID==6):
            #     line="";
        except (AttributeError, UniocodeDecodeError) as excpt:
                print("Could not decode to utf-8: %s" %excpt);
                print("Packet content: \"%s\"" %line);
                line="";
        return line;
