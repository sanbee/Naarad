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

def decnotify(argv):
    """
    De-register continuous notification associated with the given UUID.
    """
    if (len(sys.argv) < 2):

        print("\nUsage: "+sys.argv[0]+" UUID\n");
        print(decnotify.__doc__);
    else:
        try:
            uuid=sys.argv[1];

            FULLCMD="abortcnotify "+str(sys.argv[1]);
            print(FULLCMD);

            naaradSoc=mysocket();
            naaradSoc.connect(serverinfo.SERVER,serverinfo.PORT);time.sleep(0.1);
            naaradSoc.send("De-cnotify App");
            naaradSoc.send(FULLCMD);  
            naaradSoc.send("done");     
        except MyException as e:
            print(str(e));

if __name__ == "__main__":
    decnotify(sys.argv)
