import time;
RFM_SEND $1 4 10 1 # Set ping timeout to 10 sec
notify $1 4 ACKpkt: 120 2 # Wait for timeout commond to be executed
notify $1 255 ACKpkt: 120 2 # Wait for a NoOp to be exectued

RFM_SEND $1 5 4 10  # set pulse width to 40ms (to get around a bug that closes the port after 1min!)
notify $1 5 ACKpkt: 120 2 # wait for a pulse-width commmand (5) to be exectued

RFM_SEND $1 $3 $2 0  # Open the valve
notify $1 $3 ACKpkt: 120 2 # Wait for a Open (1) to be exectued
RFM_SEND $1 5 0 0  # Set pulse width to zero (to get around a bug that closes the port after 1min!)
notify $1 5 ACKpkt: 120 2 # Wait for a Pulse-width command (5) to be exectued

sleep 0.1
RFM_SEND $1 4 60 0 # Set ping timeout to 60 sec
