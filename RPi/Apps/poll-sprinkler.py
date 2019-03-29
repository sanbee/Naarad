#! /usr/bin/python
import sys
sys.path.insert(0, '../NaaradServer/NewServer');

from mySock import mysocket;
import time;
import json;

SERVER="naaradhost";
SERVER="192.168.0.66";
PORT=1234;

#
# Get the "current" packet for the given node-ID.  This is the latest packet in the
# server in-memory cache.
#
def getpkt(nodeid):
    CMD="getcpkt "+str(nodeid);
    soc=mysocket();
    soc.connect(SERVER,PORT);
    soc.send("open");time.sleep(0.1);
    soc.send(CMD); time.sleep(1);
    tt=soc.receive();
    soc.send("done");time.sleep(0.1);
    return tt;
#
# Poll the node-ID for a current packet with cmd command and from the given source.
#
def poll(nodeid, cmd, source,timeout=15,maxtrials=5):
    ntrials=int(0);
    pkt=getpkt(nodeid);
    jdict=json.loads(pkt);
    isCmd=(jdict['cmd']==int(cmd));
    isSrc=(jdict['source']==source);
    isACK=(isCmd and isSrc);
    print cmd,' ',source,' ',isCmd,' ',isSrc,' ',jdict['cmd']==int(cmd);
    while (not isACK):
        if (ntrials > maxtrials): 
            break;
        time.sleep(int(timeout));
        pkt=getpkt(nodeid);
        jdict=json.loads(pkt);
        isACK=((jdict['cmd']!=cmd) and (jdict['source']!=source));
        ntrials=ntrials+1;
        print cmd,' ',source,' ',isCmd,' ',isSrc,' ',jdict['cmd']==int(cmd),' ',ntrials, ' ',maxtrials;
    print jdict;

    return isACK; 

def main(argv):
    if (len(sys.argv) < 6):
        print "Usage: "+sys.argv[0]+" NODEID CMD-TO-POLL SOURCE-TO-POLL TIMEOUT MAXTRIALS";
    else:
        nodeid    = int(sys.argv[1]);
        cmd       = int(sys.argv[2]);
        src       = str(sys.argv[3]);
        timeout   = int(sys.argv[4]);
        maxtrials = int(sys.argv[5]);
        print "NODEID: ",nodeid," CMD: ", cmd, " SRC: ", src, "TIMEOUT: ", timeout, " MAXTRIALS: ", maxtrials;

        status=poll(nodeid=nodeid,cmd=cmd,source=src,timeout=timeout,maxtrials=maxtrials);

        if (status==True):
            sys.exit(1);
        else:
            sys.exit(0);

if __name__ == "__main__":
    main(sys.argv)
