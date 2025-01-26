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
    def __init__(self, name, uno, hLength=6*60*60*1000.0):
        Thread.__init__(self)
        settings5.topicsSubscriberList[name]=[];
        print ("List of topics: ",settings5.topicsSubscriberList.keys());
        self.name = name;
        self.uno  = uno;
        self.historyLength = hLength; # in minutes of time

    # packet is the entire packet.  thisJSON is the output of
    # json.loads(packet)
    def addPacket(self,packet,thisJSON):
        keys=thisJSON.keys();
        if 'version' in keys:
            ver=str(thisJSON['version']);
            #raise NaaradTopicException("Parsing of version "+ver+" packets not yet implemented");
            print("Parsing of version "+ver+" packets not yet implemented.\n"+packet);
        else:
            self.addPacket0(packet,thisJSON);
            
    def addPacket0(self,packet,thisJSON):
        nodeid=thisJSON["node_id"];
        thisTimeStamp=thisJSON["time"];

        # If this is the first packet from a node, make a deque for it
        # in the gPacketHistory dict.
        if (not settings5.gPacketHistory.has_key(nodeid)):
            settings5.gPacketHistory[nodeid]=deque([]);
            settings5.gTemperatureCache[nodeid] = 270.0; # Set it a magic value to initialize it.
            settings5.gTimeStamp0Cache[nodeid]=thisTimeStamp;
            settings5.gTimeStamp1Cache[nodeid]=thisTimeStamp;

        # The hueristic used to add the current packet to its node's history is:
        #   Add to history if
        #     1. The value (temperature in this case) has changed since last history record
        #                      and 
        #     2. More than 5 min. have passed since the last history record
        #                       or
        #     3. This is the first history record
        dT1=(thisTimeStamp - settings5.gTimeStamp1Cache[nodeid]);
        if ((dT1 > 60000.0) or (len(settings5.gPacketHistory[nodeid]) == 0)):
            thisTemp=thisJSON["degc"];
            dTemp=abs(settings5.gTemperatureCache[nodeid] - thisTemp);
            if (dTemp < 0.5):
                thisTemp=(settings5.gTemperatureCache[nodeid]+thisTemp)/2.0;
#            if ((settings5.gTemperatureCache[nodeid] != thisJSON["degc"]) or
            if ((thisTemp != settings5.gTemperatureCache[nodeid]) or
                 (dT1 > 120000) ): #min*60*1000
                settings5.gTimeStamp1Cache[nodeid]=thisTimeStamp;
                settings5.gTemperatureCache[nodeid]=thisTemp;
                settings5.gPacketHistory[nodeid].append(packet);
                # If the time timeStamp0 is < 0 ==> the max. history length has been hit.
                # Pop out the oldes packet.
                if (settings5.gTimeStamp0Cache[nodeid] < 0):
                    settings5.gPacketHistory[nodeid].popleft();

        # If time diff. between the latest and newest packet is >
        # threshold, set the timeStamp0 to < 0 indicating that max
        # history length has been hit.
        if ((settings5.gTimeStamp0Cache[nodeid] > 0) and ((thisTimeStamp - settings5.gTimeStamp0Cache[nodeid]) > self.historyLength)):#1800000):
            settings5.gTimeStamp0Cache[nodeid] = -1;

        # Debuggin messages
        # keys  = gPacketHistory.keys();
        # n = len(keys);
        # for i in range(n):
        #     print ("key: ",keys[i]," ",len(gPacketHistory[keys[i]])," ",thisJSON["degc"]);
# Error duing JSON parsing:
# addTimeStamp: Last token is not'}'.  Its '}}' in "{"rf_fail":0,"version":3.10,"node_id":2,"name":"ambientlight","value":11.60,"unit":"counts","source":"RS0" }}"
    def addTimeStamp(self,jsonStr):
        tok = jsonStr.split()
        n=len(tok);
        if ((n == 0) or (tok[n-1] != '}')):
            print ("addTimeStamp: Last token is not\'}\'.  Its \'"+tok[n-1]+"\' in "+"\""+jsonStr+"\"");
            return jsonStr;
        newStr="";
        for i in range(n-1):
            newStr += tok[i];
        newStr += ",\"time\":"+str(time.time()*1000.0)+" }";
        return newStr;
    # Continuously read the serial connection to Arduino UNO (in
    # blocking mode) and broadcast the packets to all client which
    # have subscribed to this topic (i.e., the list of sockets in
    # topicsSubscriberList["SensorDataSink"]).
    def run(self):
        while 1:
            line = self.uno.getSerial().readline();
            line = line.decode('utf-8').rstrip();
            #print("###: "+line);
            line = self.addTimeStamp(line);
                
            rlock = threading.RLock();
            with rlock:
                try:
                    if (("rf_fail" in line)):
                        jdict = json.loads(line);# The JSON parser
                        #print jdict;
                        if (jdict["rf_fail"]==0):
                            settings5.gCurrentPacket[jdict["node_id"]] = line;
                            self.addPacket(line,jdict);
                except ValueError as e:
                    print ("Error duing JSON parsing:");# Line=\""+line+"\""+"Error message: "+e.message());
                
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
            
