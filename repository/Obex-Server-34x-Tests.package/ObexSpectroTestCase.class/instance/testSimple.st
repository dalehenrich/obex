tests
testSimple
  | tool leaves srcDataStore excludedArray nodes |
  PersistentRoot := ObexTestResource current.
  leaves := PersistentRoot simpleLeaves.
  excludedArray := ObexTestResource current excludedParentsArray.
  System commit.
  tool := self obexTool.
  tool obexInventoryCollection: leaves asArray.
  srcDataStore := tool obexDataStoreRoot objectInventory top.
  srcDataStore excludedArray: excludedArray.
  tool obexSpectroInstances: leaves srcDataStore: srcDataStore.
  nodes := tool
    obexViewSpectroPrepareLeaves: tool obexDataStoreRoot
    sortKey: 'instances'.
  nodes inspect