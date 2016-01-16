tests
testSimple
  | tool leaves srcDataStore |
  PersistentRoot := ObexTestResource current.
  leaves := PersistentRoot simpleLeaves.
  System commit.
  tool := self obexTool.
  tool obexInventoryCollection: leaves asArray.
  srcDataStore := tool obexDataStoreRoot objectInventory top.
  tool obexSpectroInstances: leaves srcDataStore: srcDataStore.
  tool obexViewSpectro: tool obexDataStoreRoot sortKey: 'instances'