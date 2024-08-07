#! /usr/bin/python3
from __future__ import print_function;
import serverinfo
import sys
import os;
import json;
sys.path.insert(0, '../NaaradServer/NewServer');

from mySock import mysocket;
import time;

class MyException(Exception):
    pass;

def cnotifyNaaradSend(mesg):
    naaradSoc=mysocket();
    naaradSoc.connect(serverinfo.SERVER,serverinfo.PORT);
    naaradSoc.send("open");     time.sleep(0.1);
    naaradSoc.send(mesg);       time.sleep(0.1);
    infopkt=naaradSoc.receive(True); # Do a blocking read
    print(infopkt);
    packet=naaradSoc.receive(True); # Do a blocking read
    #naaradSoc.send("done");     time.sleep(1);
    #naaradSoc.close();

    jdict=json.loads(packet);
    
    # "time" is the time-stamp of the arrival of the packet on the server.  "tnot" is the
    # time-stamp when the notification was issued and the packets sent to the client.
    # Both time-stamps use the RTC of the server.
    dt=jdict["tnot"] - jdict['time'];
    return packet,dt;

def notify(argv):
    """
    The function returns a packet received from a NODEID with the
    specified command (CMD) and source (SOURCE).  Specified number of
    re-trails are made if a valid packet is not received within the
    given timeout length of time.

    The argument is a sys.argv styled list of strings.  The first
    string (argv[0]) is typically the name of the script calling this
    function (here, "notify.py").  It is ignored and therefore can be
    any string.  The rest of the strings are in the following order:

       "cnotify" NODEID CMD SOURCE TIMEOUT nRETRIALS 

    The first argument above (argv[1]) has to be the string "cnotify",
    and is the name of the notification service from the Naarad server.

    NODEID is the node-ID for which notification is sought and is the
    value of the 'node_id' or 'node' fields, whichever is available,
    in the received packet.  CMD and SOURCE are the values of the
    'cmd' and 'source' fields in the received packet both of which
    must match the given values for the packet to be valid for
    notification. TIMEOUT is the length of time in seconds after which
    the socket connection is closed and a fresh trials is made till
    the number of trials exceeds nRETRIALS or a valid packet is
    received.  If the re-trials exceed nRETRIALS or the received
    packet is not valid, the packet JSON string is appended to the
    string "FAILED: " to indicate failure to receive a valid packet in
    the given timeout and re-trail attempts.

    The first argument determine the service callback in the Naarad server.
    It therefore has to be "cnotify" for registeration in the Naarad
    server for Continuous Notification service.  The only other
    notification service is one-time notification (use the "notify" app).

    When NODEID < 0, all packets (with any value for node_id or node
    values) will be captured.  

    When CMD < 0, all packets with any cmd or source values will be
    captured.  When CMD >=0, packets that match both, cmd and source
    values will be captured.

    The received packet is marked as valid if the time-stamp in the
    packet is no older than 1.5sec.  The packet as a JSON string and
    the different between the current time and time-stamp in the
    packet are both returned to the caller.
    """
    if (len(sys.argv) < 7):

        print("\nUsage: "+sys.argv[0]+" cnotify NODEID CMD SOURCE TIMEOUT nRETRIALS\n");
        print(notify.__doc__);
    else:
        try:
            naaradcmd=sys.argv[1];
            if (naaradcmd != "cnotify"):
                raise RuntimeError("First argument is "+naaradcmd+".  Did you mean cnotify?");
            nodeid=sys.argv[2]
            cmd=sys.argv[3];
            src=str(sys.argv[4]);

            FULLCMD=naaradcmd;
            for i in range(2,6):
                FULLCMD=FULLCMD+" "+str(sys.argv[i]);

            print(FULLCMD);
            Retry=0;

            naaradSoc=mysocket();
            naaradSoc.connect(serverinfo.SERVER,serverinfo.PORT);time.sleep(0.1);
            naaradSoc.send("Cont Notification App");     
            time.sleep(0.1);
            naaradSoc.send(FULLCMD);  
            infopkt=naaradSoc.receive(True); # Do a blocking read
            print(infopkt);

            while True:
                packet=naaradSoc.receive(True);  # Do a blocking read
                # End of transmission or the notification was
                # de-registered by the server or via abortnotify
                # command.
                if (len(packet)==0):  
                    break;
                    
                print(packet);
#            naaradSoc.send("done");     
            naaradSoc.close();

        except MyException as e:
            print("###Error: MyException: "+str(e));
        except RuntimeError as re:
            print("###Error: "+str(re));

if __name__ == "__main__":
    notify(sys.argv)
