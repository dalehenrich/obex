obex view
obexViewDective: obexDataStore
  self
    obexViewDective: obexDataStore referencePaths top
    initalNodes:
      (self obexProcessNodes: obexDataStore referencePaths top searchNodeMap keys)