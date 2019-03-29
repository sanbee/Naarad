import threading;
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
        # notification of packets from the same node ID, there will to entries in this
        # list.  The discriminator for the two clients wil be the associated entires in
        # the CondList.
        self.IDList = ThreadSafeList();
        # List of threading.Condition objects associated with each entry in the IDList
        self.CondList = ThreadSafeList();
        # List of packet signatures assocaited with each entry in the IDList.  This
        # determines if the packet from the assocaited node ID is valid for issuing a
        # notification via the associated Condition in the CondLIst.
        self.PacketIDList = ThreadSafeList();
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
    

    def NaaradNotify(self,nodeid=-1,cmd=-1,src=''):
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
        
    def register(self,thisID,cond, pktID):
        myIndex=-1;
        with self.rlock:
            myIndex=len(self.IDList);
            self.IDList.append(thisID);
            self.CondList.append(cond);
            self.PacketIDList.append(pktID);
        return myIndex;

    # Using the lock of the thread (entry in the CondList list), this method uniquely
    # identifies the thread in the list of threads (CondList.findItem) and unregisters
    # the client.  The ThreadSafeLists.findItem() call assumes that the private lock of
    # each thread is unique.
    def unregister(self,myCond):
        with self.rlock:
            try:
                myIndex=self.CondList.findItem(myCond);
                print 'Unregistering ',self.IDList[myIndex[0]],self.PacketIDList[myIndex[0]];
                self.IDList.remove(myIndex[0]);
                self.CondList.remove(myIndex[0]);
                self.PacketIDList.remove(myIndex[0]);
            except IndexError:
                print "IndexError: ",self.IDList, myIndex;

