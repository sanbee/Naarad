#! /usr/bin/python
import sys
sys.path.insert(0, '../NaaradServer/NewServer');

from mySock import mysocket;
import time;
import socket;
import errno;
import json;
from socket import error;

SERVER="raspberrypi";

#SERVER="localhost";
PORT=


def poll(nsoc, nodeid,polltimeout=10.0):
    try:
        msg="";
        currentTimeout=nsoc.getSock().gettimeout();
        nsoc.getSock().settimeout(polltimeout);
        msg = nsoc.receive();
        nsoc.getSock().settimeout(currentTimeout);
    except socket.timeout as e:
        raise;
    except socket.error as e:
        raise;
    except RuntimeError as e:
        raise;
    return msg;

def isACK(jdict, cmdID):
    return (("source" in jdict.keys()) and ("ACKpkt" in jdict['source']) and
            (jdict['cmd'] == int(cmdID)));
    return False;

def sendCommand(cmd,polltimeout):
    try:
        nodeID=cmd[1];
        cmdID=cmd[2];
        args=cmd[3]+" "+cmd[4];
        CMD="RFM_SEND "+str(nodeID)+" "+str(cmdID)+" "+str(args);

        
        # nodeID=cmd[2];
        # CMD = cmd[1]+" "+cmd[2];
        print(CMD);

        soc=mysocket();

        soc.getSock().settimeout(1.0);
        soc.connect(SERVER,PORT);
        soc.send("open");time.sleep(0.1);

        soc.send(CMD);

        for i in range(10):
            try:
                soc.send("getcpkt "+str(nodeID));
                mesg="";
                mesg=poll(soc,nodeID,10);
                jdict = json.loads(mesg);

                if (isACK(jdict, cmdID)):
                    soc.send("done");time.sleep(0.1);
                    print(mesg);
                    break;
                else:
                    sys.stdout.write('o');sys.stdout.flush();
                    time.sleep(polltimeout);
            except socket.timeout as tt:
                print("Attempt "+str(i)+" "+str(tt));

    except socket.error as e:
        if (e.errno == errno.ECONNREFUSED):
            print ("socket: Connection refused");
        else:
            print("socket: I/O timed out");

# if __name__ == "__main__":
#     if (len(sys.argv) < 2):
#         print "Usage: "+sys.argv[0]+" NODEID";
#     else:
#         #sendCommand("getcpkt",sys.argv[1]);
#         sendCommand(sys.argv);

#sendCommand(["RFM_SEND", "15", "4", "10", "0"],5) # Set the node TO to 10 sec.
#sendCommand(["RFM_SEND", "15", "1", "0",  "0"],2) # Open the valve
#sendCommand(["RFM_SEND", "15", "0", "0",  "0"],2) # Stop the valve
#sendCommand(["RFM_SEND", "15", "4", "60", "0"],2) # Set the node TO to 60 sec.
