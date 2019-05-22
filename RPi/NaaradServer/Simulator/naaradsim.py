import sys;
sys.path.insert(0, '../NewServer');

import socket;
import time;
import select;
import errno;
from socket import error as socket_error;
import json;
import threading;
from threading import Thread;

from mySock import *;
from myClientThread5 import ClientThread;
import settings5; # All the global settings
import PacketHandler as ph;
from PogoSim import *;
from comPortSim import *;
from NaaradTopicSim import NaaradTopicSim;

pogo=0;
uno=0;
#
#------------------------------------------------------------------------------------------------------
#
# Start the interfaces to the radios (OOKRadio and PacketRadio), open
# the com port (connection to Ardunio), and start the loop that waits
# for data to arrive on the com port.
def initNaarad():
    global settings5, comPort;
    global pogo, uno, ph;

    historyLength=6*60*60*1000.0; 
    pHndlr=ph.PacketHandler(historyLength);
    # Initialize all the globals
    settings5.init();
    #
    # Start the connection to the serial port.  This is the interface for
    # i/o to Arduino UNO
    #uno=comPort(port=settings5.NAARAD_COMPORT,baudrate=9600);
    uno=comPortSim(port=settings5.NAARAD_COMPORT);
    uno.open();
    #
    # The top-level interface of the Naarad (it still carries the old
    # name) system that access both the radios.  This is where the
    # heuristics and smarts based on the data collected from pktRadio and
    # command issued via ookRadio will be implemented.
    pogo = PogoSim(None,None);
    # Amount of temporal history the server holds in milli-seconds. 
    historyLength=6*60*60*1000.0; 
    pHndlr=ph.PacketHandler(historyLength);
    nSensorNetworkData = NaaradTopicSim(settings5.NAARAD_TOPIC_SENSORDATA, uno,pHndlr);
    nSensorNetworkData.start();
#------------------------------------------------------------------------------------------------------
#
# 
def startServer():
    global settings5, mysocket, ClientThread
    global uno, pogo;
    
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
        fd = select.select([serversocket.fileno()],[],[]);
        (clientsocket, address) = serversocket.accept()
        
        #     #now do something with the clientsocket
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
        myCTh = ClientThread(threadID, name, myc1, uno, pogo, connectionType);
        threadID = threadID+1;
        myCTh.start();
        if (settings5.NAARAD_SHUTDOWN):
            print ("### Exiting Naarad socket server thread");

if __name__ == "__main__":
    initNaarad();
    startServer();
