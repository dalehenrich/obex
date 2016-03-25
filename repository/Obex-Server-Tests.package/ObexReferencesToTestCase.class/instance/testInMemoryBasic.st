tests
testInMemoryBasic
  | simpleData obj dataStore oopToNodeMap nodes leaves excluded parents beep |
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
  beep := {}.
  nodes := leaves collect: [ :leaf | oopToNodeMap at: leaf asOop ].
  beep add: (nodes at: 1) printString.
  nodes := nodes sort: [ :a :b | a printString <= b printString ].
  beep add: (nodes at: 1) printString.
  parents := (nodes at: 1) parents asArray.
  self
    assert:
      (nodes collect: [ :each | each testPrintString ]) = #('ObexTestObject1, [0::1]').
  1 to: parents size do: [ :index | (parents at: index) parents ].
  self
    assert:
      (parents collect: [ :each | each testPrintString ]) asArray
        = #('ObexTestObjectArray, [1::1]').
  self
    assert:
      (((nodes at: 1) parents at: 1) parents asArray
        collect: [ :each | each testPrintString ]) = #('ObexTestObject, [1::0]')