*obex-server-34x-tode
obexViewParentsDective: obexDataStore
  self
    obexViewDective: obexDataStore parentsOf top
    initalNodes:
      (self obexProcessNodes: obexDataStore parentsOf top searchNodeMap keys)