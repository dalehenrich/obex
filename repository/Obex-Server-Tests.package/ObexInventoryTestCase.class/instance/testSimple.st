tests
testSimple
  "
  obex inventory
  obex view --limit=20 --inventory=instances
  obex view --limit=20 --inventory=bytes
"

  | tool leaves dataStore byteCounts instanceCounts |
  leaves := ObexTestResource current simpleLeaves.
  System commit.
  tool := self obexTool.
  tool obexInventoryCollection: leaves asArray.
  dataStore := tool obexDataStoreRoot objectInventory top.
  byteCounts := dataStore sortedClassByteCountList.
  instanceCounts := dataStore sortedClassInstanceCountList.
  self
    assert:
      (byteCounts collect: [ :each | each printString ])
        =
          #('ObexTestObject3, [3:168]' 'ObexTestObject2, [2:112]' 'ObexTestObjectByte, [3:96]' 'ObexTestObject1, [1:56]')