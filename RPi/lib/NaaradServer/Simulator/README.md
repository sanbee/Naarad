This contains code to simulate a Naarad server for testing.

naarad_setpaths.py sets the path for importing modules. This
first looks for local version of modules and if found, loads it.
If not found, it looks in ../NewServer.

../NewServer/naarad.py is loaded to get the initNaarad() and
the startServer() functions.

Start the simulator with

      python -B naaradsim.py

A local version of comPort classes is loaded, which simulates
reading from a serial port.  
