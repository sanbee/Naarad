import threading;
import uuid;
from threading import Thread, Condition, Event, RLock;
from ThreadSafeList import *;

class ClientList():
    def __init__(self):
        # This class represents a collection of clients registered to receive
        # notification on the arrival of a particular Naarad packet from a particular
        # Naarad node.  This is a collection of lists of type ThreadSafeList, one each
        # for the Naarad node ID (IDList) from which to watch for the requested packets,
        # Condition (CondList) and PacketID (PacketIDList) for which notification is
        # requested.  The requested packet is identified by the combination of the
        # command and source in the packet.

        # List of node IDs for which some cleint thread is awaiting notification.  The
        # IDs need not be unique in this list.  E.g. if two separate threads are awaiting
        # notification of packets from the same node ID, there will two entries in this
        # list.  The discriminator for the two clients will be the associated entires in
        # the CondList.

        self.IDList = ThreadSafeList();

        # List of threading.Condition objects associated with each entry in the IDList

        self.CondList = ThreadSafeList();

        # List of packet signatures assocaited with each entry in the IDList.  This
        # determines if the packet from the assocaited node ID is valid for issuing a
        # notification via the associated Condition in the CondLIst.

        self.PacketIDList = ThreadSafeList();


        self.ContinuousNotification = ThreadSafeList();

        self.uuid = ThreadSafeList();

        self.rlock = RLock();

    def getIDList(self):
        return self.IDList;
        
    def getCondList(self):
        return self.CondList;

    def getPktIDList(self):
        return self.PacketIDList;

    def isValid(self,index, cmd, src):
        return ((cmd == self.PacketIDList[index][0]) and
                (src == self.PacketIDList[index][1]));
    

    def continuousNotification(self,uuid):
        try:
            myIndex=self.uuid.findItem(uuid);
            return self.ContinuousNotification[myIndex[0]];
        except IndexError as e:
                print "IndexError: ",self.IDList, myIndex;
                raise e;

    def abortContinuousNotification(self,uuid):
        myIndex=self.uuid.findItem(uuid);
        self.ContinuousNotification[myIndex[0]]=False;

    def NaaradNotify(self,nodeid=-1,cmd=-1,src=''):
        """
        For nodeid < 0, generate notification for packets with 
        any nodeid.  For nodeid >=0 generate notification only
        for packets that have a matching nodeid.
        
        For cmd < 0, generate notification for any value of
        cmd and source fields in the packets.  For cmd >=0
        generate notification only for packets for which
        isValid(threadIndex,cmd,src) is true.  I.e., notification
        for only those packets which have the given combination 
        of cmd and source fields.
        """
        #Notify all register threads
        if (nodeid < 0):
            with self.rlock:
                for c in self.CondList:
                    with c:
                        c.notify();
        else:
            #Notify all registered threads with nodeid;
            with self.rlock:
                threadIndices=self.IDList.findItem(nodeid);
                for i in threadIndices:
                    if (self.isValid(i,cmd,src)):
                        c=self.CondList[i];
                        with c:
                            c.notify();
        
    def register(self,thisID,cond, pktID,continuousNotification=False):
        myIndex=-1;
        with self.rlock:
            hex_uuid=uuid.uuid4().hex;

            myIndex=len(self.IDList);
            print;
            print "Registered: ",thisID,pktID,hex_uuid,myIndex;
            print;
            self.IDList.append(thisID);
            self.CondList.append(cond);
            self.PacketIDList.append(pktID);
            self.ContinuousNotification.append(continuousNotification);
            self.uuid.append(hex_uuid);

        return hex_uuid;

    # Using the uuid entries, this method identifies a unique thread
    # in the list of threads (uuid.findItem) and deregisters the
    # client.  
    def unregister(self,uuid):
        with self.rlock:
            try:
                myIndex=self.uuid.findItem(uuid);
                print;
                print "De-registering: ",self.IDList[myIndex[0]],self.PacketIDList[myIndex[0]],self.uuid[myIndex[0]];
                print;
                self.IDList.remove(myIndex[0]);
                self.CondList.remove(myIndex[0]);
                self.PacketIDList.remove(myIndex[0]);
                self.ContinuousNotification.remove(myIndex[0]);
                self.uuid.remove(myIndex[0]);
            except IndexError as e:
                print "IndexError: ",self.IDList, myIndex;
                raise e;
