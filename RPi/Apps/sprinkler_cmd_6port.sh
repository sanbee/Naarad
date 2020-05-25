
# $1: nodeID
# $2: Port no.
# $3: 0 (close) or 1 (open)

if [ $# -lt 3 ]; then
    echo "Usage: $0 NodeID Port# 0/1"
elif [ $3 -eq 0 ]; then 
    echo "Closing port "$2" on node "$1;
    ./cmdnaarad.py RFM_SEND $1 4 10 1 # Set ping timeout to 10 sec
    
    sleep 0.1
    ./notify.py notify $1 4 ACKpkt: 120 2 # Wait for timeout commond to be executed
    ./notify.py notify $1 255 ACKpkt: 120 2 # Wait for a NoOp to be exectued
    
    sleep 1
    ./cmdnaarad.py RFM_SEND $1 5 4 10  # Set pulse width to 40ms (to get around a bug that closes the port after 1min!)
    ./notify.py notify $1 5 ACKpkt: 120 2 # Wait for a Pulse-width commmand (5) to be exectued
    
    ./cmdnaarad.py RFM_SEND $1 0 $2 0  # Close the valve
    ./notify.py notify $1 0 ACKpkt: 120 2 # Wait for a Close (0) to be exectued
    sleep 0.1
    ./cmdnaarad.py RFM_SEND $1 4 60 0 # Set ping timeout to 60 sec
    echo "...done";
else
    echo "Opening port "$2" on node "$1;
    ./cmdnaarad.py RFM_SEND $1 4 10 1 # Set ping timeout to 10 sec
    sleep 0.1
    ./notify.py notify $1 4 ACKpkt: 120 2 # Wait for timeout commond to be executed
    ./notify.py notify $1 255 ACKpkt: 120 2 # Wait for a NoOp to be exectued
        
    sleep 1
    ./cmdnaarad.py RFM_SEND $1 5 4 10  # set pulse width to 40ms (to get around a bug that closes the port after 1min!)
    ./notify.py notify $1 5 ACKpkt: 120 2 # wait for a pulse-width commmand (5) to be exectued
    
    ./cmdnaarad.py RFM_SEND $1 1 $2 0  # Open the valve
    ./notify.py notify $1 1 ACKpkt: 120 2 # Wait for a Open (1) to be exectued
    
    ./cmdnaarad.py RFM_SEND $1 5 0 0  # Set pulse width to zero (to get around a bug that closes the port after 1min!)
    ./notify.py notify $1 5 ACKpkt: 120 2 # Wait for a Pulse-width command (5) to be exectued
    
    sleep 0.1
    ./cmdnaarad.py RFM_SEND $1 4 60 0 # Set ping timeout to 60 sec
    echo "...done";
fi
