def getNodeID(jdict):
    if ("node" in jdict.keys()):
        return jdict['node'];
    if ("node_id" in jdict.keys()):
        return jdict['node_id'];
    raise ValueError("Node ID not found");
