# Naarad
A simple house monitor and control system. 

The *Naarad* system is a network of remote Nodes with radios operating at 433 MHz, a Base Station with an RFM69CW (RFM)packet 
radio, currently connected to an Arduino UNO.  The UNO talks to a Linux-based computer (currently a Rasberry PI (RPi)) via the 
serial connection.  RPi also listens for incoming socket connections.  Commands for the *Naarad* network are either generated at the 
RPi or arrive at the socket (e.g. from a remotely connected device).  Commands meant for the UNO or the remote Nodes are sent to the UNO via the serial connection.  The server
on the UNO then transmits the commands for the remote Nodes via the RFM or via another radio for remote OOK devices.  Similarly, 
information from remote Nodes is received at the UNO via the RFM and immediately tranferred to the RPi via the serial 
connection for consumption.

This repository has the code for the three components of the Naarad system: 
  * The code running on the MCUs on the remote node is in the Node directory
  * The code running on the Arduino UNO on the Base Station is in the BaseStation directory
  * The code running on the central comptuer (RaspberryPi) is in the RPi directory

The communication with the RFM is done using the [JeeLib](https://github.com/jcw/jeelib) library from [JeeLabs](https://jeelabs.org).

The communication hardware on the remote Nodes is derived from the [TinyTx](https://nathan.chantrell.net/tinytx-wireless-sensor) 
design.
