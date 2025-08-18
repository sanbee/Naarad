This contains code to simulate a Naarad server for testing.

NaaradTopicSim.py is now almost identical to the production version in
../NewServer/NaaradTopic2.py.  The differences are in the name of the
class, and the actions take when exiting run() method.  These need to
be tested a bit more, after which this class will not be necessary.
Instead, the production version in ../NewServer can be used.

naaradsim.py can similarly be made quite similar to the production
version in ../NewServer/naarad.py.  This needs to be done and tested.

Start the simulator with

      python -B naaradsim.py


This instantiated the NaaradTopicSim and comPortSim classes.  The
latter is a used to realize a simulation of reading from a serial
port.  NaaradTopicSim may be replaced with ../NewServer/NaaradTopic2,
but this needs to be tested.