tests
testInMemoryBasic
  | simpleData obj dataStore oopToNodeMap nodes leaves excluded xNodes yNodes |
  simpleData := ObexTestObject new.
  obj := ObexTestObject1 new.
  simpleData
    slot2:
      (ObexTestObjectArray new
        add: obj;
        yourself).
  leaves := {obj}.
  excluded := {}.
  excluded
    add: leaves;
    add: excluded;
    add: self.
  dataStore := OXReferencesToDataStore new
    excludedArray: excluded;
    yourself.
  dataStore listInMemoryReferences: leaves.
  oopToNodeMap := dataStore oopToNodeMap.
  xNodes := nodes := leaves collect: [ :leaf | oopToNodeMap at: leaf asOop ].
  nodes := nodes sort: [ :a :b | a printString <= b printString ].
  self
    assert:
      (yNodes := nodes collect: [ :each | each testPrintString ])
        = #('ObexTestObject1, [0::1]').
  self
    assert:
      ((nodes at: 1) parents asArray collect: [ :each | each testPrintString ])
        = #('ObexTestObjectArray, [1::1]').
  self
    assert:
      (((nodes at: 1) parents at: 1) parents asArray
        collect: [ :each | each testPrintString ]) = #('ObexTestObject, [1::0]')