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
  srcDataStore
    parentLimit: leaves size;
    excludedArray: excludedArray.
  tool obexSpectroInstances: leaves srcDataStore: srcDataStore.
  nodes := tool
    obexViewSpectroPrepareLeaves: tool obexDataStoreRoot
    sortKey: 'instances'.
  self
    assert:
      (nodes collect: [ :each | each printString ])
        =
          #('ObexTestObjectByte[0::2]' 'ObexTestObject3[0::2]' 'ObexTestObject2[0::2]' 'ObexTestObject1[0::2]').
  self
    assert:
      ((nodes at: 1) parents collect: [ :each | each printString ])
        = #('Array[0::2]' 'ObexTestObjectArray[0::1]').
  self
    assert:
      (((nodes at: 1) parents at: 2) parents collect: [ :each | each printString ])
        = #('ObexTestObject[0::1]').	"ignore Array as it is part of resource structure"
  self
    assert:
      ((nodes at: 2) parents collect: [ :each | each printString ])
        = #('Array[0::2]' 'ObexTestObjectArray[0::1]').
  self
    assert:
      (((nodes at: 2) parents at: 2) parents collect: [ :each | each printString ])
        = #('ObexTestObject[0::1]').	"ignore Array as it is part of resource structure"
  self
    assert:
      ((nodes at: 3) parents collect: [ :each | each printString ])
        = #('Array[0::2]' 'ObexTestObjectArray[0::1]').
  self
    assert:
      (((nodes at: 3) parents at: 2) parents collect: [ :each | each printString ])
        = #('ObexTestObject[0::1]').	"ignore Array as it is part of resource structure"
  self
    assert:
      ((nodes at: 4) parents collect: [ :each | each printString ])
        = #('Array[0::2]' 'ObexTestObjectArray[0::1]').
  self
    assert:
      (((nodes at: 4) parents at: 2) parents collect: [ :each | each printString ])
        = #('ObexTestObject[0::1]')	"ignore Array as it is part of resource structure"