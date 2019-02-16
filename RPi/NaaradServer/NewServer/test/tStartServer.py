import sys
sys.path.insert(0, '..');

import socket;
import time;
from mySock import mysocket;
import select;

def startServer():
    NAARAD_PORT=1234;
    serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM);
    serversocket.setsockopt( socket.SOL_SOCKET, socket.SO_REUSEADDR, 1 );
    serversocket.bind(('localhost', NAARAD_PORT));
    serversocket.listen(2);

    threadID=0;
    while 1:
        fd = select.select([serversocket.fileno()],[],[]);
        (clientsocket, address) = serversocket.accept()
        
        #     #now do something with the clientsocket
        myc1 = mysocket(clientsocket);
        connectionType=myc1.receive().strip();
        print ("connection accepted",address,connectionType);
        msg = myc1.receive();
        print msg;

startServer();
