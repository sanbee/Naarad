import threading;
from threading import Thread;
import settings5;
import time;
import json;
import NaaradUtils as Utils;
import random;

# Class to create a topic of type name.  In implementation, this is a
# thread that listens for in-coming packets on the serial connection
# to the UNO and conveys them to all sockets in the
# topicsSubscriberList["SensorDataSink"].
#
# This class access the following global variable (from settings5.py):
#    topicsSubscriberList, NAARAD_TOPIC_SENSORDATA,
#    gPacketHistory, gTimeStamp0Cache, gTemperatureCache,
#    gCurrentPacket
class NaaradTopicException(Exception):
    pass;

class NaaradTopicSim (Thread):
    def __init__(self, name, uno, pktHndlr, hLength=6*60*60*1000.0):
        Thread.__init__(self)
        settings5.topicsSubscriberList[name]=[];
        print ("List of topics: ",settings5.topicsSubscriberList.keys());
        self.name = name;
        self.uno  = uno;
        self.historyLength = hLength; # in minutes of time
        self.pktHndlr=pktHndlr;

    # Continuously read the serial connection to Arduino UNO (in
    # blocking mode) and broadcast the packets to all client which
    # have subscribed to this topic (i.e., the list of sockets in
    # topicsSubscriberList["SensorDataSink"]).
    def run(self):
        nodech=0;
        while (not settings5.NAARAD_SHUTDOWN):
            time.sleep(5);
            try:
                nodech+=1;
                jdict={};
                jdict["rf_fail"]=1;
                #jdict["cmd"]=-1;
                node=1;
                if (nodech%10==0):
                    node=3;
                jdict["node_id"]=node;
                jdict["degc"]=20.0+(random.random()-0.5)/2.0;
                jdict["node_p"]=-30.0-random.random()*30.0;
                jdict["source"]="naaradsim";
                line =json.dumps(jdict);
            except (AttributeError, UniocodeDecodeError) as excpt:
                print("Could not decode to utf-8: %s" %excpt);
                line="";
            #line = self.pktHndlr.addTimeStamp(line);
            if (not ("cmd" in line)):
                jdict=json.loads(line);
                line = json.dumps(Utils.modifyJSON(jdict,["cmd"],[-1])).decode();

            print("@@@: "+line);
            #print("###: "+line);
                
            rlock = threading.RLock();
            with rlock:
                try:
                    if (("rf_fail" in line)):
                        line = Utils.addTimeStamp("time",line);
                        jdict = json.loads(line);# The JSON parser
                        # print jdict;

                        # Always add the packet to the current packet
                        # cache.
                        #
                        # NOTE TO SELF: This cache should become cache
                        # for ACK packets only.  Currnet packet is the
                        # right-most packet in the gPacketHistory
                        # queue.
                        nodeID=Utils.getNodeID(jdict);
                        settings5.gCurrentPacket[nodeID] = line;
                        if (jdict["rf_fail"]==0):
                            self.pktHndlr.addPacket(line,jdict);
                        else:
                            self.pktHndlr.processInfoPacket(nodeID, jdict);
                            #self.addPacket(line,jdict);
                except ValueError as e:
                   # print ("Error duing JSON parsing: Line=\""+line+"\""+"Error message: "+e.message());
                    print ("Error duing JSON parsing: Line=\""+line+"\"");
        if (settings5.NAARAD_SHUTDOWN):
            print("### Exiting com port server thread");
