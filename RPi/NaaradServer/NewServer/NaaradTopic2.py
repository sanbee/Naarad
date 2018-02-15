import threading;
from threading import Thread;
import settings5;
import time;
import json;
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
        while 1:
            try:
                line =self.uno.readline().rstrip();
            except (AttributeError, UniocodeDecodeError) as excpt:
                print("Could not decode to utf-8: %s" %excpt);
                line="";
            #line =self.uno.getSerial().readline();
            # try:
            #     tt=line.decode('UTF-8',errors='ignore');
            #     # print('XXXX: '+tt);
            #     line = tt.rstrip();
            # except(AttributeError, UnicodeDecodeError):
            #     print("Could not decode to utf-8");
            #     line="";

            # A HACK: The JSON string from UNO does not seem to be
            # cleared up properly.  As a result, if one string was
            # (e.g.), "{a, b, c }" and the next one was shorter, like
            # "{a, b }", it comes out looking like {"a, b }}".  This
            # should be fixed in the UNO code.
            line=line.replace(" }}", " }");

            print("@@@: "+line);
            line = self.pktHndlr.addTimeStamp(line);
            #print("###: "+line);
                
            rlock = threading.RLock();
            with rlock:
                try:
                    if (("rf_fail" in line)):
                        jdict = json.loads(line);# The JSON parser
                        #print jdict;
                        if (jdict["rf_fail"]==0):
                            settings5.gCurrentPacket[jdict["node_id"]] = line;
                            self.pktHndlr.addPacket(line,jdict);
                            #self.addPacket(line,jdict);
                except ValueError as e:
                   # print ("Error duing JSON parsing: Line=\""+line+"\""+"Error message: "+e.message());
                    print ("Error duing JSON parsing: Line=\""+line+"\"");
                
            #print ("From DCT: ", line+" "+str(len(settings5.topicsSubscriberList)));
            nListners = len(settings5.topicsSubscriberList[settings5.NAARAD_TOPIC_SENSORDATA]);
            #
            # All sockets are set to non-blocking before sending data.
            # If the other end of the socket is broken and not
            # emptying the buffer, this call will ultimately fail
            # (after the buffer is full).  When that happens, remove
            # the associated subscriber. Since the socket buffer is
            # finite and usually large compared to the data being
            # sent, this will fail only after many trials making it
            # "robust" as well (i.e., the listner is allowed to not
            # receive many many packets before it is considered dead
            # and removed from the list of listeners).
            for i in range(nListners):
                try:
                    settings5.topicsSubscriberList[settings5.NAARAD_TOPIC_SENSORDATA][i].setblocking(0);
                    settings5.topicsSubscriberList[settings5.NAARAD_TOPIC_SENSORDATA][i].send(line);
                    settings5.topicsSubscriberList[settings5.NAARAD_TOPIC_SENSORDATA][i].setblocking(1);
                except socket_error as serr:
                    if serr.errno == 11:#errno.EAGAIN:
                        print ("Error: Client resource temporarily unavailable for subscriber ",i);
                    print ("NaardTopic: socket_error occured during send.  Closing connection.", i);
                    sockID = settings5.topicsSubscriberList[settings5.NAARAD_TOPIC_SENSORDATA][i]
                    settings5.topicsSubscriberList[settings5.NAARAD_TOPIC_SENSORDATA][i].close();
                    settings5.topicsSubscriberList[settings5.NAARAD_TOPIC_SENSORDATA].remove(sockID);
                    break;
                except RuntimeError as e:
                    print ("NaardTopic: RunTimeError occured during send/recv.  Closing connection.", i);
                    sockID = settings5.topicsSubscriberList[settings5.NAARAD_TOPIC_SENSORDATA][i]
                    settings5.topicsSubscriberList[settings5.NAARAD_TOPIC_SENSORDATA][i].close();
                    settings5.topicsSubscriberList[settings5.NAARAD_TOPIC_SENSORDATA].remove(sockID);
                    break; # break the for-loop
            #print ("No. of listeners: ", nListners);
            
