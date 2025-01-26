import socket;
import time;
from mySock import *;
import serial;
import select;
import sys;
import errno;
from socket import error as socket_error;
import json;

from Pogo import *;
from comPort import *;
from OOKRadio import *;
from PacketRadio import *;
import os;#, threading;
import threading;
from threading import Thread;
from myClientThread5 import ClientThread;
import settings5; # All the global settings
from NaaradTopic2 import NaaradTopic;
import PacketHandler as ph;
#
#------------------------------------------------------------------------------------------------------
#

# Initialize all the globals
settings5.init();

#
# Start the connection to the serial port.  This is the interface for
# i/o to Arduino UNO
#uno=comPort(port=settings5.NAARAD_COMPORT,baudrate=9600);
uno=comPort(port=settings5.NAARAD_COMPORT);
uno.open();
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

pHndlr=ph.PacketHandler(6*60*60*1000.0);
nSensorNetworkData = NaaradTopic(settings5.NAARAD_TOPIC_SENSORDATA, uno,pHndlr);
#nSensorNetworkData = NaaradTopic(settings5.NAARAD_TOPIC_SENSORDATA, uno);

nSensorNetworkData.start();

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
while 1:
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
