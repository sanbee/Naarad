import sys
import os
NAARAD_HOME="/home/sbhatnag@ad.nrao.edu/Packages/Naarad/";
file_path = os.path.dirname(__file__)
sys.path.append(file_path);
head,tail=os.path.split(file_path);
#sys.path.insert(0, file_path+'/../NaaradServer/NewServer');
lib_path=NAARAD_HOME+'RPi/lib/NaaradServer/NewServer';
sys.path.insert(0, lib_path);

print("# Loading Naarad modules from: ",file_path,lib_path);
