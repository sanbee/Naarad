#! /usr/bin/python
from __future__ import print_function;
import serverinfo
import sys
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

def cnotify(argv):
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

    The first argument above (argv[1]) has to be the string "notify".
    NODEID is the node-ID for which notification is sought and is the
    value of the 'node_id' or 'node' fields, whichever is available,
    in the received packet.  CMD and SOURCE are the values of the
    'cmd' and 'source' fields in the received packet both of which
    must match the given values for the packet to be valid for
    notification. NODEID=-1 indicates that notification is requested
    for packets from all nodes (any node).  CMD=-1 indicates that
    notification is requested for a packet with any command.  Hence,
    NODEID=-1 and CMD=-1 will ignore SOURCE specification and will 
    issue notification for all packets received at the server.

    TIMEOUT is the length of time in seconds after which
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
        print(cnotify.__doc__);
    else:
        try:
            naaradcmd=argv[1];
            nodeid=argv[2]
            cmd=argv[3];
            src=str(argv[4]);

            FULLCMD=naaradcmd;
            for i in range(2,6):
                FULLCMD=FULLCMD+" "+str(argv[i]);

            print(FULLCMD);
            Retry=0;

            naaradSoc=mysocket();
            naaradSoc.connect(serverinfo.SERVER,serverinfo.PORT);time.sleep(0.1);
            naaradSoc.send("Cont Notification App");     
            time.sleep(0.1);
            naaradSoc.send(FULLCMD);  
            infopkt=naaradSoc.receive(True); # Do a blocking read
            print(infopkt);
            time_offset = time.timezone if (time.localtime().tm_isdst == 0) else time.altzone;
            while True:
                try:
                    packet=naaradSoc.receive(True);  # Do a blocking read
                    # End of transmission or the notification was
                    # de-registered by the server or via abortnotify
                    # command.
                    if (len(packet)==0):  
                        break;
                    # Convert time to human-readable format
                    # time.asctime(time.gmtime(1592929995433.7449/1000.0 - 6*3600)) to get the MDT.
                    jdict=json.loads(packet);
                    tt = jdict['time'];
                    dt=jdict["tnot"] - jdict['time'];
                    jdict["tnot"]='{:2.2f}'.format(dt);
                    jdict["time"]=time.asctime(time.gmtime(tt/1000.0 - time_offset));
                    print(json.dumps(jdict));
                except KeyboardInterrupt as e:
                    print(str(e)+" cnotify interrupted.  Exiting...");
                    break;
                except:
                    print("\ncnotify interrupted.  Exiting...");
                    break;
            naaradSoc.close();
        except MyException as e:
            print("MyException::cnotify: "+str(e));

if __name__ == "__main__":
    cnotify(sys.argv)
