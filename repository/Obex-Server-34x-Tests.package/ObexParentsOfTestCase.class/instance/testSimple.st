tests
testSimple
  "
  obex parents --st=`{(MetacelloProjectRegistration registry registrations at: 1) projectSpec}`
  obex view --detective=parents
"

  | leaves dataStore oopToNodeMap nodes excludedArray ans |
  PersistentRoot := ObexTestResource current.
  leaves := PersistentRoot simpleLeaves.
  System commit.
  excludedArray := ObexTestResource current excludedParentsArray.
  dataStore := OXRefPathParentsOfDataStore new
    excludedArray: excludedArray;
    findRefPathsParentsOfObjects: leaves;
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
  self assert: ans = #('ObexTestObject, [1::0]')