#! /usr/bin/python
import naaradpath
import serverinfo;
import sys;
from mySock import mysocket;
import time;

def gethpkt(server,port, nodeid):
    if ("-1" in nodeid):
        print("###Error: Support for nodeid=-1 to get a list of node IDs from the server is not yet enabled");
        return;
    soc=mysocket();
    soc.connect(server,port);
    soc.send("open");time.sleep(0.1);

    # The following code snippet to be enabled along with
    # mods in myClientThread5.py::getNodeList() to return
    # the list of node IDs.  Without those changes, the
    # soc.reveive() below will block.
    #
    # if (int(nodeid[0])==-1):
    #     CMD="getnodelist";
    #     soc.send(CMD); time.sleep(0.1);
    #     val=soc.receive();
    #     nodeIDList=list(map(int,val.split()));
    #     print("Node list: ",nodeIDList);

    for i in range(len(nodeid)):
        CMD="gethpkt "+str(nodeid[i]);
        soc.send(CMD); time.sleep(0.1);
        tt='';
        while(tt != "PHINISHED"):
            try:
                val=soc.receive(robust=True);
                ff=val.split();
                if (len(ff) > 0):
                    tt=val.split()[0];
                else:
                    tt="";
                if (tt!="PHINISHED"):
                    print(val);
            except RuntimeError:
                print("RuntimeError:");

    soc.send("done");time.sleep(0.1);

def main(argv):
    if (len(sys.argv) < 2):
        print("Usage: "+sys.argv[0]+" NODEID0 [NODEID1...]");
    else:
        n = len(argv);
        gethpkt(serverinfo.SERVER, serverinfo.PORT, sys.argv[1:n]);

if __name__ == "__main__":
    main(sys.argv)
