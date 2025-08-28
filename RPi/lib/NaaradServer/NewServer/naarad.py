import os
import sys;

# Set paths, especially for loading the Naarad modules.
from naarad_setpaths import *;

# Locally necessary modules.  Load a local copy, if found.  Else load
# from naarad_file_path set in naarad_setpaths.
from naarad_imports import *;

# Modules that interface with hardware.  Load a local copy, if found.
# Else load from naarad_file_path set in naarad_setpaths.
from naarad_hwimports import *;
#
#------------------------------------------------------------------------------------------------------
#
# Initialize various components, the packet handler and the global
# settings (settings5.init()).  These are not re-initialized in the
# event of an automatic reboot, carrying the history records and the state of
# components across reboots.
# pogo=0;
# uno=0;
historyLength=6*60*60*1000.0;
pHndlr=ph.PacketHandler(historyLength);
# Initialize all the globals
settings5.init();
#
#------------------------------------------------------------------------------------------------------
#
# Start the interfaces to the radios (OOKRadio and PacketRadio), open
# the com port (connection to Ardunio), and start the loop that waits
# for data to arrive on the com port.
def initNaarad():
    global settings5, comPort, PacketRadio, OOKRadio;
    global ph, pHndlr;
   # global pogo, uno;

    # Initialization of the following is moved to the global scope to
    # enable state of the system to be carried across automatic
    # reboots.
    #
    # pHndlr=ph.PacketHandler(historyLength);
    # # Initialize all the globals
    # settings5.init();

    #
    # Start the connection to the serial port.  This is the interface for
    # i/o to Arduino UNO
    #uno=comPort(port=settings5.NAARAD_COMPORT,baudrate=9600);
    uno=comPort(port=settings5.NAARAD_COMPORT);
    uno.open();
    time.sleep(1);
    #
    # Instantiate the object that encapsulates communcation to the packet
    # radio (RFM64CW) connected to UNO.
    pktRadio = PacketRadio(uno);
    #
    # Instantiate the object that encapsulates communcation to the OOK
    # radio connected to the UNO.
    ookRadio = OOKRadio(uno);
    #
    # The top-level interface of the Naarad (it still carries the old
    # name) system that access both the radios.  This is where the
    # heuristics and smarts based on the data collected from pktRadio and
    # command issued via ookRadio will be implemented.
    pogo = Pogo(pktRadio, ookRadio);

    # Amount of temporal history the server holds in milli-seconds.
    nSensorNetworkData = NaaradTopic(settings5.NAARAD_TOPIC_SENSORDATA, uno,pHndlr);

    # Start an infinite loop on a separate thread which waits for data
    # to arrive on the com port (from Arduino) and ingest it.  This
    # writes to global arrays defined in settings5 object.  The
    # primary responsibility of this thread is to read the com port
    # (so that it does not get full), validate the data it reads from
    # the com port, and add it to the history records.
    #
    # History currently is only held in the RAM (for the historyLength
    # length of time).  When we make the history more persistent
    # (sqlite DB), this is the thread that will do it.
    nSensorNetworkData.start();
    return uno,pogo;
#------------------------------------------------------------------------------------------------------
#
#
def startServer(uno_l,pogo_l):
    global settings5, mysocket, ClientThread
#    global uno, pogo;

    serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM);
    serversocket.setsockopt( socket.SOL_SOCKET, socket.SO_REUSEADDR, 1 );
    serversocket.bind(('', settings5.NAARAD_PORT));
    serversocket.listen(settings5.NAARAD_MAXCONNECTIONS);

    # The socket server loop. A new connection, after being accepted, is
    # serviced via a new thread (ClientThread).  ClientThread adds the
    # opened socket to the topicsSubscriberList if the reqeusted
    # connection was of type SensorDataSink.  This server thread
    # terminates when the connection terminates and the associated socket
    # is also removed from the topicsSubscriberList.
    threadID=0;
    while (not settings5.NAARAD_SHUTDOWN):
        try:
            fd = select.select([serversocket.fileno()],[],[]);
            (clientsocket, address) = serversocket.accept()

            #now do something with the clientsocket
            myc1 = mysocket(clientsocket);
            connectionType=myc1.receive().strip();
            print ("connection accepted",address,connectionType);

            # Start a new thread to service this socket connection.  The
            # thread exits when end-of-communication command ("done") is
            # received on myc1 socket or if there is an irrecoverable error or
            # when the client closes the socket or when the client dies.  In
            # all cases, ClientThread also closes the myc1 socket before
            # exiting.
            name = "Th"+str(threadID);
            myCTh = ClientThread(threadID, name, myc1, uno_l, pogo_l, connectionType);
            threadID = threadID+1;
            myCTh.start();
            if (settings5.NAARAD_SHUTDOWN):
                print ("### Exiting Naarad socket server thread");
                break;
        except KeyboardInterrupt:
            print("\nIgnoring Ctrl-C.  Use \"sendcmd shutdown\" (twice) to shutdown the server");

if __name__ == "__main__":
    REBOOTS=5;
    n=0;
    t0=time.time();
    while(True):
        if (n > REBOOTS):
            break;
        print("Boot sequence initiated...");
        settings5.NAARAD_SHUTDOWN=False;
        (uno_g, pogo_g)=initNaarad();
        startServer(uno_g,pogo_g);
        uno_g.close();
        time.sleep(5);
        print("Re-booting naarad...#",n);
        # Limit the number of rapid reboots
        tNow=time.time();
        if (tNow-t0 < 3600):
            t0=tNow;
            n=n+1;
