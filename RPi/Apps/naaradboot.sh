#! /bin/sh

FLASH='/mnt/flash1';
if grep -qs $FLASH /proc/mounts; then
    echo "$FLASH is mounted."
else
    echo "Mounting $FLASH."
    sudo mount -o uid=pi,gid=pi /dev/sda1 $FLASH
    #sudo ~pi/bin/mnt.sh  # This mounts the flash1 drive where the source code is
    sleep 5
fi

cd /mnt/flash1/Arduino/Git/Arduino/unoserver2/NewServer

# Use unoserver2.ino for Arduino UNO

# Use "screen /dev/ttyACM0 19200" to connect to Arduino via the serial port

# Start the socket server
# This has the latest getcpkt and gethpkt protocol
#python serversoc4.py
screen -d -m -t Naarad python naarad.py

# Can also use python serversock5.py as of Jan 5, 2017
