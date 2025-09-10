import sys;
import json;
# file_path = '/tmp/packets.dat';
# with open(file_path, 'r') as file:
#     for line in file:
#         if ((line.split()[0] != "PHINISHED") and (line[0] != '#')):
#             data = json.loads(line);
#             print(data);

def isData(line):
    return ((line.split()[0] != "PHINISHED") and (line[0] != '#'));

for line in sys.stdin:
    print(line);
    if (isData(line)):
        data = json.loads(line);
        print(data);


# Now 'data' contains the Python object representation of your JSON
#print(data)
