def getNodeID(jdict):
    if ("node" in jdict.keys()):
        return jdict['node'];
    if ("node_id" in jdict.keys()):
        return jdict['node_id'];
    raise ValueError("Node ID not found");

def modifyJSON(jdict,keyword,value,op=0):
    #        jdict=json.loads(jsonStr);
    if (op == 0): # add
        for i in range(len(keyword)):
            jdict[keyword[i]]=value[i];
    if (op == 1): # delete
        for i in range(len(keyword)):
            del jdict[keyword[i]];
    return jdict;
    #   return json.dumps(jdict);

