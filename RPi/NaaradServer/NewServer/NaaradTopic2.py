import threading;
from threading import Thread;
import settings5;
import time;
import json;
import NaaradUtils as Utils;

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

class NaaradTopic (Thread):
    def __init__(self, name, uno, pktHndlr):
        Thread.__init__(self)
        settings5.topicsSubscriberList[name]=[];
        print ("List of topics: ",settings5.topicsSubscriberList.keys());
        self.name = name;
        self.uno  = uno;
        self.pktHndlr=pktHndlr;

    # Continuously read the serial connection to Arduino UNO (in
    # blocking mode) and broadcast the packets to all client which
    # have subscribed to this topic (i.e., the list of sockets in
    # topicsSubscriberList["SensorDataSink"]).
    def run(self):
        while (not settings5.NAARAD_SHUTDOWN):
            try:
                line =self.uno.readline().rstrip();
            except (AttributeError, UnicodeDecodeError) as excpt:
                print("Could not decode to utf-8: %s" %excpt);
                line="";

            if (not ("cmd" in line)):
                line=Utils.addKey("cmd",-1,line);

            #print("@@@: "+time.asctime()+": "+line);
            print("@@@: "+time.strftime("%a %b %d %H:%M:%S %Y")+":: "+line);
            rlock = threading.RLock();
            with rlock:
                try:
                    if (("rf_fail" in line)):
                        line,jdict = Utils.addTimeStamp("time",line);
                        #jdict = json.loads(line);# The JSON parser

                        # Always add the packet to the current packet
                        # cache.
                        #
                        # NOTE TO SELF: This cache should become cache
                        # for ACK packets only.  Currnet packet is the
                        # right-most packet in the gPacketHistory
                        # queue.
                        nodeID=Utils.getNodeID(jdict);
                        if (nodeID > 0):
		       	    settings5.gCurrentPacket[nodeID] = line;
                        if (jdict["rf_fail"]==0):
                            self.pktHndlr.addPacket(line,jdict);
                        self.pktHndlr.processInfoPacket(nodeID, jdict);

                except ValueError as e:
                   # print ("Error duing JSON parsing: Line=\""+line+"\""+"Error message: "+e.message());
                    print ("Error duing JSON parsing: Line=\""+line+"\"");
        print("### Exiting Naarad comPort server thread");    
