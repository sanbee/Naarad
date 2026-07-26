import threading;
from threading import Thread;
import settings5;
import time;
import NaaradUtils as Utils;

# import naaradpath
#import serverinfo;
from mySock import mysocket;
import sys

def shutdown(log=True):
    if (log):
        with open("/tmp/naarad_reboot.log", 'a') as file:
            file.write("Reboot process started at: "+time.asctime()+"\n");

    CMD="shutdown";
    SERVER="localhost";
    PORT=1234;

    naaradSoc=mysocket();
    naaradSoc.connect(SERVER,PORT);
    naaradSoc.send("sendcmd App");
    naaradSoc.send(CMD);time.sleep(0.1);
    naaradSoc.send("done");
    naaradSoc.close();

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
    #
    #--------------------------------------------------------------
    # An attempt for automatic reboot in case of uno timeout:
    #
    # A blank line from uno.readline() seems to be the only way to
    # detect that com-port (uno) timedout (!).  On uno timeout,
    # NaaradTopicException is raised.  It's resolution is to send
    # "shutdown" on the socket connection that processes client
    # requests in the main thread.
    #
    # The NaaradTopicException here ultimately exits this thread.  And
    # the shutdown() commands exit the StartServer() call in the main
    # thread (see naarad.py).  This effectively reboots the system by
    # calling initNaarad() and startServer() in the main() of
    # naarad.py
    def run(self):
        while (not settings5.NAARAD_SHUTDOWN):
            line='{}';
            try:
                line =self.uno.readline()
                # if (not line):
                #     print("NaaradTopic2::run(): readline() on COM port timedout (uno.readline())");
                #     raise NaaradTopicException;
                #     line='{}';
                # else:
                line = line.rstrip();
            except (AttributeError, UnicodeDecodeError) as excpt:
                print("Could not decode to utf-8: %s" %excpt);
                print("Packet content: \"%s\"" %line);
                line='{}';
            except NaaradTopicException as e:
                # Send the shutdown command (twice!) on the server
                # port.  This exits the startServer() call in
                # naarad.py, allowing the reboot requence to begin.
                print("Shutting down NT2...");
                # shutdown();
                # shutdown(False); # Don't log a message 

            if (not ("cmd" in line)):
                line=Utils.addKey("cmd",-1,line);

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

                        # Save packets to the global latest packet cache. The global
                        # latestPacket cache is used for notification listners (via
                        # notify or cnotify).
                        settings5.gLatestPacket = line;

                        if (nodeID > 0):
                            settings5.gCurrentPacket[nodeID] = line;
                        if (jdict["rf_fail"]==0):
                            self.pktHndlr.addPacket(line,jdict);
                        self.pktHndlr.processInfoPacket(nodeID, jdict);

                except ValueError as e:
                   # print ("Error duing JSON parsing: Line=\""+line+"\""+"Error message: "+e.message());
                    print ("Error duing JSON parsing: Line=\""+line+"\"");
        print("### Exiting Naarad comPort server thread");    
