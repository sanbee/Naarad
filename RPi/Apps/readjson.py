#! /usr/bin/python
import sys;
import json;

def isData(line):
    return ((line.split()[0] != "PHINISHED") and (line[0] != '#'));

for line in sys.stdin:
#    print(line);
    if (isData(line)):
        data = json.loads(line);
        print("D: ",data,flush=True);
        print("D:    ",data.get("degc"),data.get("time"),flush=True);
