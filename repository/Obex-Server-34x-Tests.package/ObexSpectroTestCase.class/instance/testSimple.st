tests
testSimple
  "
  obex inventory --st=`ObexTestResource current simpleObjects`
  obex view --limit=100 --inventory=instances
  obex spectro --src=inventory --bytes --classes=10 --exclude=`ObexTestResource current excludedParentsArray`
  obex view --spectro=instances
"

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
  nodes := nodes sort: [ :a :b | a printString <= b printString ].
  self
    assert:
      (nodes collect: [ :each | each printString ])
        =
          #('ObexTestObject1[0::1]' 'ObexTestObject2[0::1]' 'ObexTestObject3[0::1]' 'ObexTestObjectByte[0::1]').
  self
    assert:
      (((nodes at: 1) parents collect: [ :each | each printString ])
        sort: [ :a :b | a <= b ]) = #('ObexTestObjectArray[0::1]').
  self
    assert:
      (((nodes at: 1) parents at: 1) parents collect: [ :each | each printString ])
        = #('ObexTestObject[0::0]').
  self
    assert:
      (((nodes at: 2) parents collect: [ :each | each printString ])
        sort: [ :a :b | a <= b ]) = #('ObexTestObjectArray[0::1]').
  self
    assert:
      ((((nodes at: 2) parents at: 1) parents at: 1) parents
        collect: [ :each | each printString ]) = #('ObexTestObject[0::0]').
  self
    assert:
      (((nodes at: 3) parents collect: [ :each | each printString ])
        sort: [ :a :b | a <= b ]) = #('ObexTestObjectArray[0::1]').
  self
    assert:
      (((((nodes at: 3) parents at: 1) parents at: 1) parents at: 1) parents
        collect: [ :each | each printString ]) = #('ObexTestObject[0::0]').
  self
    assert:
      (((nodes at: 4) parents collect: [ :each | each printString ])
        sort: [ :a :b | a <= b ]) = #('ObexTestObjectArray[0::1]').
  self
    assert:
      (((nodes at: 4) parents at: 1) parents collect: [ :each | each printString ])
        = #('ObexTestObject[0::0]')