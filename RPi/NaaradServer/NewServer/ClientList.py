import threading;
from threading import Thread, Condition, Event, RLock;
from ThreadSafeList import *;

class ClientList():
    def __init__(self):
        # Lists with thread-safe methods
        self.IDList = ThreadSafeList();
        self.CondList = ThreadSafeList();
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

    # Using the lock of the thread calling this method to uniquely identify the thread in
    # the list of threads.  This assumes that the private lock of each thread will not be
    # equal to the similar private lock of any other thread.
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

