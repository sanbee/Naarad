from ClientList import ClientList;

def init():
    global NAARAD_COMPORT,NAARAD_PORT,NAARAD_MAXCONNECTIONS,NAARAD_HISTORYLENGTH;
    global NAARAD_TOPIC_SENSORDATA,topicsSubscriberList,gCurrentPacket;
    global gPacketHistory, gTimeStamp0Cache,gTimeStamp1Cache,gValueCache;
    global NAARAD_NAMELESS_PACKETS, NAARAD_SHUTDOWN, NAARAD_HISTORYLENGTH;
    global gClientList;

    NAARAD_COMPORT = "/dev/ttyACM0";
    # Port number for the socket listening for incoming requests
    NAARAD_PORT=1234;
    NAARAD_MAXCONNECTIONS = 10;
    # Amount of temporal history the server holds in milli-seconds. 
    NAARAD_HISTORYLENGTH=2*24*60*60*1000.0;

    NAARAD_NAMELESS_PACKETS = "NONAME";

    # Name of topic that is server async to all subscribers
    NAARAD_TOPIC_SENSORDATA = "SensorDataSink"; 

    # Flag used to shutdown Naarad server.
    NAARAD_SHUTDOWN = False;

    # List of subscribers per topic
    topicsSubscriberList={};
    # The cache for the latest packet per node (now redunt due history of
    # packets, but still in use)
    gCurrentPacket = {};
    # Cache of deques per node that hold history of packets for certain
    # length of time (given as a parameter to the NaaradTopic
    # constructor).
    gPacketHistory= {};
    # Caches for the earliest time-stamp and the latest temperature value
    # in the caches per node.
    gTimeStamp0Cache={}; # Oldest
    gTimeStamp1Cache={}; # Youngest
    gTemperatureCache={};

    gTimeStamp0Cache={}; # Oldest
    gTimeStamp1Cache={}; # Youngest
    gValueCache={};
    
    # Container of list of client threads (from myClientList)
    # requesting notification of arrival of packets with particular
    # signature.  The signature of the requested packets is a
    # combination of the "node_id", "cmd" and "source" fields in the
    # packet.  These values for these are also in this container per
    # client.  Each client also has threading.Condition() object to
    # receive the notification from the PacketHandler.
    # PacketHandler.processInfoPackets() uses the
    # ClientList.NaaradNotify() to deliver the notification for the
    # relevant packets.
    gClientList = ClientList();
