import sys
import os
file_path = os.path.dirname(__file__)
sys.path.append(file_path);
print("Loading Naarad modules from: ",file_path);
sys.path.insert(0, file_path+'/../NaaradServer/NewServer');

