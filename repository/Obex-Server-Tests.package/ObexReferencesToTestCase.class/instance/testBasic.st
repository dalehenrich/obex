tests
testBasic
  | simpleData obj dataStore oopToNodeMap nodes leaves |
  simpleData := ObexTestObject new.
  obj := ObexTestObject1 new.
  simpleData
    slot2:
      (ObexTestObjectArray new
        add: obj;
        yourself).
  PersistentRoot := {simpleData}.
  leaves := {obj}.
  System commit.
  dataStore := OXReferencesToDataStore new
    excludedArray: {PersistentRoot};
    listReferences: leaves;
    yourself.
  oopToNodeMap := dataStore oopToNodeMap.
  nodes := leaves collect: [ :leaf | oopToNodeMap at: leaf asOop ].
  nodes := nodes sort: [ :a :b | a printString <= b printString ].
  self
    assert:
      (nodes collect: [ :each | each testPrintString ]) = #('ObexTestObject1, [0::1]').
  self
    assert:
      ((nodes at: 1) parents asArray collect: [ :each | each testPrintString ])
        = #('ObexTestObjectArray, [1::1]').
  self
    assert:
      (((nodes at: 1) parents at: 1) parents asArray
        collect: [ :each | each testPrintString ]) = #('ObexTestObject, [1::0]')