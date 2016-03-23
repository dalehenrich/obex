tests
testSimple
  "
  obex references --st=`ObexTestResource current simpleLeaves`
  obex view --detective
"

  | leaves dataStore oopToNodeMap nodes excludedArray ans |
  PersistentRoot := ObexTestResource current.
  leaves := PersistentRoot simpleLeaves.
  System commit.
  excludedArray := ObexTestResource current simpleDataExcludedParents.
  dataStore := OXReferencesToDataStore new
    excludedArray: excludedArray;
    listReferences: leaves;
    yourself.
  oopToNodeMap := dataStore oopToNodeMap.
  nodes := leaves collect: [ :leaf | oopToNodeMap at: leaf asOop ].
  nodes := nodes sort: [ :a :b | a printString <= b printString ].
  self
    assert:
      (nodes collect: [ :each | each testPrintString ])
        =
          #('ObexTestObject1, [0::1]' 'ObexTestObject2, [0::1]' 'ObexTestObject2, [0::1]' 'ObexTestObject3, [0::1]' 'ObexTestObject3, [0::1]' 'ObexTestObject3, [0::1]' 'ObexTestObjectByte, [0::1]' 'ObexTestObjectByte, [0::1]' 'ObexTestObjectByte, [0::1]').
  ans := ((nodes at: 1) parents collect: [ :each | each testPrintString ])
    asArray sort: [ :a :b | a <= b ].
  self assert: ans = #('ObexTestObjectArray, [1::1]').
  ans := (((nodes at: 1) parents at: 1) parents
    collect: [ :each | each testPrintString ]) asArray sort: [ :a :b | a <= b ].
  self assert: ans = #('ObexTestObject, [1::0]').
  ans := ((nodes at: 2) parents collect: [ :each | each testPrintString ])
    asArray sort: [ :a :b | a <= b ].
  self assert: ans = #('ObexTestObjectArray, [2::1]').
  ans := (((nodes at: 2) parents at: 1) parents
    collect: [ :each | each testPrintString ]) asArray sort: [ :a :b | a <= b ].
  self assert: ans = #('ObexTestObjectArray, [1::1]').
  ans := ((((nodes at: 2) parents at: 1) parents at: 1) parents
    collect: [ :each | each testPrintString ]) asArray sort: [ :a :b | a <= b ].
  self assert: ans = #('ObexTestObject, [2::0]').
  ans := ((nodes at: 4) parents collect: [ :each | each testPrintString ])
    asArray sort: [ :a :b | a <= b ].
  self assert: ans = #('ObexTestObjectArray, [3::1]').
  ans := (((nodes at: 4) parents at: 1) parents
    collect: [ :each | each testPrintString ]) asArray sort: [ :a :b | a <= b ].
  self assert: ans = #('ObexTestObjectArray, [1::1]').
  ans := ((((nodes at: 4) parents at: 1) parents at: 1) parents
    collect: [ :each | each testPrintString ]) asArray sort: [ :a :b | a <= b ].
  self assert: ans = #('ObexTestObjectArray, [1::1]').
  ans := (((((nodes at: 4) parents at: 1) parents at: 1) parents at: 1) parents
    collect: [ :each | each testPrintString ]) asArray sort: [ :a :b | a <= b ].
  self assert: ans = #('ObexTestObject, [3::0]').
  ans := ((nodes at: 7) parents collect: [ :each | each testPrintString ])
    asArray sort: [ :a :b | a <= b ].
  self assert: ans = #('ObexTestObjectArray, [3::1]').
  ans := (((nodes at: 7) parents at: 1) parents
    collect: [ :each | each testPrintString ]) asArray sort: [ :a :b | a <= b ].
  self assert: ans = #('ObexTestObject, [4::0]')