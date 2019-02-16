#! /usr/bin/python
import sys
import json;
sys.path.insert(0, '../NaaradServer/NewServer');

from mySock import mysocket;
import time;

SERVER="raspberrypi";
SERVER="192.168.0.66";
PORT=1234;

class MyException(Exception):
    pass;


def main(argv):
        if (len(sys.argv) < 7):
            print "Usage: "+sys.argv[0]+" notify NODEID CMD SOURCE TIMEOUT nRETRIALS\n";
        else:
            try:
                naaradcmd=sys.argv[1];
                nodeid=sys.argv[2]
                cmd=sys.argv[3];
                src=str(sys.argv[4]);
                for i in range(2,6):
                    naaradcmd=naaradcmd+" "+str(sys.argv[i]);

                nRETRIALS=int(sys.argv[6]);

                FULLCMD=naaradcmd;

                print FULLCMD;
                Retry=0;
                while (Retry < nRETRIALS):
                    naaradSoc=mysocket();
                    naaradSoc.connect(SERVER,PORT);
                    naaradSoc.send("open");time.sleep(0.1);
                    naaradSoc.send(FULLCMD);time.sleep(0.1);
                    tt=naaradSoc.receive();
                    print tt,"   : Trial ",Retry;
                    jdict=json.loads(tt);
                    print time.time()*1000 - jdict['time'];

                    if ((time.time()*1000 - jdict['time']) > 1500.0):
                        Retry += 1;
                    else:
                        Retry = nRETRIALS+1;

                        naaradSoc.send("done");time.sleep(0.1);
                        naaradSoc.close();
            except MyException as e:
                print str(e);

if __name__ == "__main__":
    main(sys.argv)