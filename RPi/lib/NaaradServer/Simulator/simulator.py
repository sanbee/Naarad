import os
import sys;
#
# This loads the local naarad_setpaths.py
#
# The local version of naarad_setpaths is loaded below.  This sets the
# paths to first look for files locally, and then in ../NewServer.
# This is an attempt to allow modifying the behaviour of the server
# program (../NewServer/naarad.py) by defining local import files,
# which, if found will be loaded first for naarad.py below.
#
from naarad_setpaths import *;
#
# The naarad.py module below is loaded from ../NewServer. This is the
# driver program that starts the naarad sever.  This further imports
# the following files.  Local version of these, if present, will be
# loaded. Otherwise, the version from ../NewSerer will be loaded.
#
# from naarad_setpaths import *;
# from naarad_imports import *;
# from naarad_hwimports import *;

# The local version of comPort.py simulates the OTA packets read from
# a simulated serial port.

from naarad import *;

if __name__ == "__main__":
    REBOOTS=5;
    n=0;
    t0=time.time();
    while(True):
        if (n > REBOOTS):
            break;
        print("Boot sequence initiated...");
        settings5.NAARAD_SHUTDOWN=False;
        (uno_g, pogo_g)=initNaarad(); # Start the NaaradTopic thread, that injests OTA packets, and return.
        startServer(uno_g,pogo_g);    # This is blocking, listening on the socket for client connection requests.
        uno_g.close();
        time.sleep(5);
        print("Re-booting naarad...#",n);
        # Limit the number of rapid reboots
        tNow=time.time();
        if (tNow-t0 < 3600):
            t0=tNow;
            n=n+1;
