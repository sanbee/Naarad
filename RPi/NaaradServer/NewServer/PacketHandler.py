import time;
import json;
import settings5;
from collections import deque;
import NaaradUtils as Utils;

class PacketHandler():
    def __init__(self,hLength):
        self.historyLength=hLength;
        pass;

    def addPacket31(self,packet,thisJSON):
        nodeid=thisJSON["node_id"];
        thisTimeStamp=thisJSON["time"];
        paramName = thisJSON["name"];
        
        if (nodeid,paramName) not in settings5.gPacketHistory:
            # This is the first packet for the (nodeid,paramName) combination
            settings5.gPacketHistory[nodeid,paramName]=deque([]);
            settings5.gValueCache[nodeid,paramName] = 1e6; # Set it a magic value to initialize it.
            settings5.gTimeStamp0Cache[nodeid,paramName]=thisTimeStamp;
            settings5.gTimeStamp1Cache[nodeid,paramName]=thisTimeStamp;

        dT1=(thisTimeStamp - settings5.gTimeStamp1Cache[nodeid,paramName]);
        if ((dT1 > 60000.0) or (len(settings5.gPacketHistory[nodeid,paramName]) == 0)):
            thisTemp=thisJSON["value"];
            dTemp=abs(settings5.gValueCache[nodeid,paramName] - thisTemp);
            if (dTemp < 0.5):
                thisTemp=(settings5.gValueCache[nodeid,paramName]+thisTemp)/2.0;
#            if ((settings5.gTemperatureCache[nodeid] != thisJSON["degc"]) or
            if ((thisTemp != settings5.gValueCache[nodeid,paramName]) or
                 (dT1 > 120000) ): #min*60*1000
                settings5.gTimeStamp1Cache[nodeid,paramName]=thisTimeStamp;
                settings5.gValueCache[nodeid,paramName]=thisTemp;
                settings5.gPacketHistory[nodeid,paramName].append(packet);
                # If the time timeStamp0 is < 0 ==> the max. history length has been hit.
                # Pop out the oldes packet.
                if (settings5.gTimeStamp0Cache[nodeid,paramName] < 0):
                    settings5.gPacketHistory[nodeid,paramName].popleft();

        # If time diff. between the latest and newest packet is >
        # threshold, set the timeStamp0 to < 0 indicating that max
        # history length has been hit.
        if ((settings5.gTimeStamp0Cache[nodeid,paramName] > 0) and ((thisTimeStamp - settings5.gTimeStamp0Cache[nodeid,paramName]) > self.historyLength)):#1800000):
            settings5.gTimeStamp0Cache[nodeid,paramName] = -1;


    def processInfoPacket(self, thisNodeID, thisJSON):
        keys=thisJSON.keys();
        if 'cmd' in keys:
            settings5.gClientList.NaaradNotify(thisNodeID,thisJSON['cmd'],thisJSON['source']);
        
    def addPacket(self,packet,thisJSON):
        keys=thisJSON.keys();
        if 'version' in keys:
            ver=str(thisJSON['version']);
            if (ver=="3.1"):
                self.addPacket31(packet,thisJSON);
            else:
                #raise NaaradTopicException("Parsing of version "+ver+" packets not yet implemented");
                print("Parsing of version "+ver+" packets not yet implemented.\n"+packet);
                print("Param name: \""+thisJSON['name']+"\"");
        else:
            self.addPacket0(packet,thisJSON);
            #            print "V0->3.1: ",self.convertV0ToV31(thisJSON);
            
    def addPacket0(self,packet,thisJSON):
        nodeid=thisJSON["node_id"];
        thisTimeStamp=thisJSON["time"];

        # If this is the first packet from a node, make a deque for it
        # in the gPacketHistory dict.
        if nodeid not in settings5.gPacketHistory:
            settings5.gPacketHistory[nodeid]=deque([]);
            settings5.gValueCache[nodeid] = 270.0; # Set it a magic value to initialize it.
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
            dTemp=abs(settings5.gValueCache[nodeid] - thisTemp);
            if (dTemp < 0.5):
                thisTemp=(settings5.gValueCache[nodeid]+thisTemp)/2.0;
#            if ((settings5.gTemperatureCache[nodeid] != thisJSON["degc"]) or
            if ((thisTemp != settings5.gValueCache[nodeid]) or
                 (dT1 > 120000) ): #min*60*1000
                settings5.gTimeStamp1Cache[nodeid]=thisTimeStamp;
                settings5.gValueCache[nodeid]=thisTemp;
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

    def modifyJSON(self,jdict,keyword,value,op=0):
        #        jdict=json.loads(jsonStr);
        if (op == 0): # add
            for i in range(len(keyword)):
                jdict[keyword[i]]=value[i];
        if (op == 1): # delete
            for i in range(len(keyword)):
                del jdict[keyword[i]];
        return jdict;
       #   return json.dumps(jdict);

    def convertV0ToV31(self,jsonDict):
#        jdict=json.loads(jsonStr);

        keywords=["name",             "unit",    "value"]; # Added these keywords....
        values     =["temperature",  "C",        jsonDict["degc"]]; #...with these values.

        xx=self.modifyJSON(jsonDict,keywords,values,0);
        return json.dumps(jsonDict);
        
    def addTimeStamp(self,jsonStr):
        try:
            jdict=json.loads(jsonStr);
            keywords=["time"]; values=[time.time()*1000.0];
            self.modifyJSON(jdict,keywords,values,0); # Add time=value
            return json.dumps(jdict);
        except(ValueError) as excpt:
            print("Not a JSON string: %s"%jsonStr);
            return jsonStr;
        
    def addTimeStamp_Old(self,jsonStr):
        tok = jsonStr.split()
        n=len(tok);
        #print(n," ",tok);
        if ((n > 0) and (tok[n-1] != '}')):
            print ("addTimeStamp: Last token is not\'}\'.  Its \'"+tok[n-1]+"\' in "+"\""+jsonStr+"\"");
            return jsonStr;
        newStr="";
        for i in range(n-1):
            newStr += tok[i];
        newStr += ",\"time\":"+str(time.time()*1000.0)+" }";
        return newStr;
