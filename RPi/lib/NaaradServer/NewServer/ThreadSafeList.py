from threading import RLock;

class ThreadSafeList(list):
    def __init__(self):
        self.lock = RLock()

    def append(self, val):
        self.lock.acquire()
        try:
            list.append(self, val)
        finally:
            self.lock.release()

    def remove(self,index):
        self.lock.acquire();
        try:
            del self[index];
        finally:
            self.lock.release();

    def findItem(self,aItem):
        self.lock.acquire();
        try:
            indices = [];
            n=len(self);
            for i in range(0,n):
                if (aItem == self[i]):
                    indices.append(i);
        finally:
            self.lock.release();
        return indices;

