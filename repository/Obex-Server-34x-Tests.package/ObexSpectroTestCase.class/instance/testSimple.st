tests
testSimple
  | tool leaves srcDataStore classArray |
  PersistentRoot := ObexTestResource current.
  leaves := PersistentRoot simpleLeaves.
  System commit.
  tool := self obexTool.
  tool obexInventoryCollection: leaves asArray.
  srcDataStore := tool obexDataStoreRoot objectInventory top.
  classArray := (#('ObexTestObjectGeneric' 'ObexTestObject' 'ObexTestObject1' 'ObexTestObject2' 'ObexTestObject3' 'ObexTestObjectArray' 'ObexTestObjectByte')
    collect: [ :clsName | Smalltalk at: clsName ]) asArray.
  tool obexSpectro: classArray srcDataStore: srcDataStore.
  tool obexViewSpectro: tool obexDataStoreRoot spectro top sortKey: 'bytes'