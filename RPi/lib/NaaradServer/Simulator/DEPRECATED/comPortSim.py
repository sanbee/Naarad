# USE OF THIS IS DEPRECATED.  THE LOCAL comPort.py HAS THIS CODE NOW AND IS IMPORTED INSTEAD.
import time;
import json;
import random;
#
# comPort simulation.
#
class comPortSim:
    '''
    Object to manage USB-serial connection to Arduino (UNO).
    '''
    def __init__(self, port='/dev/ttyACM0', baudrate=19200):
        self.nodech=0;
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
        try:
            self.nodech+=1;
            time.sleep(5);
            jdict={};
            jdict["rf_fail"]=0;
            node=1;
            if (self.nodech%5==0):
                node=3;
                jdict["rf_fail"]=1;
            jdict["node_id"] = node;
            jdict["degc"]    = 20.0+(random.random()-0.5)/2.0;
            jdict["node_p"]  = -30.0-random.random()*30.0;
            jdict["source"]="naaradsim";
            line =json.dumps(jdict);
            if (self.nodech==3):
                line="Three!";
        except (AttributeError, UniocodeDecodeError) as excpt:
                print("Could not decode to utf-8: %s" %excpt);
                print("Packet content: \"%s\"" %line);
                line="";
        return line;
