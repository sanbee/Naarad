from ClientList import ClientList;

def init():
    global NAARAD_COMPORT,NAARAD_PORT,NAARAD_MAXCONNECTIONS ;
    global NAARAD_TOPIC_SENSORDATA,topicsSubscriberList,gCurrentPacket;
    global gPacketHistory, gTimeStamp0Cache,gTimeStamp1Cache,gValueCache;
    global NAARAD_NAMELESS_PACKETS;
    global gClientList;

    NAARAD_COMPORT = "/dev/ttyACM0";
    # Port number for the socket listening for incoming requests
    NAARAD_PORT=1234;
    NAARAD_MAXCONNECTIONS = 10;

    NAARAD_NAMELESS_PACKETS = "NONAME";

    # Name of topic that is server async to all subscribers
    NAARAD_TOPIC_SENSORDATA = "SensorDataSink"; 
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
    
    gClientList = ClientList();
