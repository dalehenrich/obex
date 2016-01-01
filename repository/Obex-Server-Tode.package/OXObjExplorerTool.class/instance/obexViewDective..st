obex view
obexViewDective: obexDataStore
  self
    obexViewDective: obexDataStore referencePaths top
    initalNodes: (self obexProcessNodes: obexDataStore searchNodeMap keys)