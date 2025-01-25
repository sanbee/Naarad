#! /usr/bin/python
import sys
import os
import time;
file_path = os.path.dirname(__file__)

sys.path.append(file_path);
print("Loading Naarad modules from: ",file_path);
sys.path.insert(0, file_path+'/../NaaradServer/NewServer');

import serverinfo;
from mySock import mysocket;

def main(argv):
    if (len(argv) < 3):
        print("Usage: "+argv[0]+" LAMP 0|1");
    else:
    	LAMP=argv[1];
    	OP=argv[2];
    	CMD="tell "+LAMP+" "+OP;

    	naaradSoc=mysocket();
    	naaradSoc.connect(serverinfo.SERVER, serverinfo.PORT);
    	naaradSoc.send("lightOn App");time.sleep(0.1);
    	naaradSoc.send(CMD);time.sleep(0.1);
    	naaradSoc.send("done");time.sleep(0.1);
    	naaradSoc.close();

if __name__ == "__main__":
    main(sys.argv)
