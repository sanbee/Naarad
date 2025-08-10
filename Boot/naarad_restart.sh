#! /bin/bash

FLASH='/mnt/flash1';

killall -9 screen
screen -wipe

if grep -qs $FLASH /proc/mounts; then
    echo "$FLASH is mounted."
else
    echo "Mounting $FLASH."
    sudo mount -o uid=pi,gid=pi /dev/sda1 $FLASH
    #sudo ~pi/bin/mnt.sh  # This mounts the flash1 drive where the source code is
    sleep 5
fi

cd $FLASH/Naarad/Boot
sh naaradboot.github.sh 
sleep 5
cd ../RPi/Apps
./cmdnaarad.py RFM_SEND 17 4 60 1
./cmdnaarad.py RFM_SEND 15 4 60 1

