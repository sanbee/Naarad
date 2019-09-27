#! /usr/bin/python
from __future__ import print_function;
import sys
import json;
sys.path.insert(0, '../NaaradServer/NewServer');
import serverinfo

from mySock import mysocket;
import time;

class MyException(Exception):
    pass;

def notifyNaaradSend(mesg):
    naaradSoc=mysocket();

    naaradSoc.connect(serverinfo.SERVER,serverinfo.PORT);
    naaradSoc.send("notify App");     time.sleep(0.1);
    naaradSoc.send(mesg);       time.sleep(0.1);
    #infopkt=naaradSoc.receive(True); # Do a blocking read
    #print(infopkt);
    packet=naaradSoc.receive(True); # Do a blocking read
    time.sleep(1);
    #naaradSoc.send("done");     time.sleep(1);
    #naaradSoc.close();

    jdict=json.loads(packet);
    
    # "time" is the time-stamp of the arrival of the packet on the server.  "tnot" is the
    # time-stamp when the notification was issued and the packets sent to the client.
    # Both time-stamps use the RTC of the server.
    if (jdict['rf_fail'] == 2):
        dt=1600;
    else:
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

       "notify" NODEID CMD SOURCE TIMEOUT nRETRIALS 

    The first argument above (argv[1]) has to be the string "notify".
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

    The received packet is marked as valid if the time-stamp in the
    packet is no older than 1.5sec.  The packet as a JSON string and
    the different between the current time and time-stamp in the
    packet are both returned to the caller.
    """
    if (len(argv) < 7):

        print("\nUsage: "+argv[0]+" notify NODEID CMD SOURCE TIMEOUT nRETRIALS\n");
        print(notify.__doc__);
    else:
        try:
            naaradcmd=argv[1];
            nodeid=argv[2]
            cmd=argv[3];
            src=str(argv[4]);

            FULLCMD=naaradcmd;
            for i in range(2,6):
                FULLCMD=FULLCMD+" "+str(argv[i]);

            nRETRIALS=int(argv[6]);

            print(FULLCMD);
            Retry=0;
            while (Retry < nRETRIALS):
                packet, dt = notifyNaaradSend(FULLCMD);
                if (dt > 1500.0):
                    Retry += 1;
                else:
                    break;

            if ((Retry >= nRETRIALS) or (dt > 1500.0)):
                print("FAILED: ", end='');
            print(packet,"   : Trial ",Retry,dt);

        except MyException as e:
            print(str(e));

if __name__ == "__main__":
    notify(sys.argv)
