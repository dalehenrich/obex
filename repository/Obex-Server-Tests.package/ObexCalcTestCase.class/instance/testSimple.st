tests
testSimple
  "
  obex calc 821761 15772161 24451841 25085953
  obex view --detective=reference
"

  | tool leaves dataStore limitArray oopToNodeMap searchNodeMap refPathMap classNameMap instanceCountMap |
  PersistentRoot := ObexTestResource current.
  leaves := PersistentRoot simpleLeaves.
  System commit.
  [ 
  PersistentRoot simpleLeaves: #().
  System commit.
  tool := self obexTool.
  limitArray := tool obexMinLimitSetForRefPathScan.
  limitArray add: ObexTestResource current.
  tool
    obexFindAllReferencePathsToObjects: leaves asArray
    limitObjArray: limitArray.
  dataStore := tool obexDataStoreRoot referencePaths top.
  oopToNodeMap := dataStore oopToNodeMap.
  searchNodeMap := dataStore searchNodeMap.
  refPathMap := Dictionary new
    at: #'ObexTestObjectByte'
      put:
        #('ObexTestResource, [1::0]' 'ObexTestObject, [4::1]' 'ObexTestObjectArray, [3::1]' 'ObexTestObjectByte, [0::1]');
    at: #'ObexTestObject1'
      put:
        #('ObexTestResource, [1::0]' 'ObexTestObject, [4::1]' 'ObexTestObjectArray, [1::1]' 'ObexTestObject1, [0::1]');
    at: #'ObexTestObject2'
      put:
        #('ObexTestResource, [1::0]' 'ObexTestObject, [4::1]' 'ObexTestObjectArray, [1::1]' 'ObexTestObjectArray, [2::1]' 'ObexTestObject2, [0::1]');
    at: #'ObexTestObject3'
      put:
        #('ObexTestResource, [1::0]' 'ObexTestObject, [4::1]' 'ObexTestObjectArray, [1::1]' 'ObexTestObjectArray, [1::1]' 'ObexTestObjectArray, [3::1]' 'ObexTestObject3, [0::1]');
    yourself.
  leaves
    do: [ :leaf | 
      | node refPathPrintStrings |
      node := oopToNodeMap at: leaf asOop.
      refPathPrintStrings := (searchNodeMap at: node) first
        collect: [ :each | each testPrintString ].
      self assert: (refPathMap at: node className) = refPathPrintStrings ].
  classNameMap := dataStore classNameMap.
  instanceCountMap := Dictionary new
    at: #'ObexTestObject' put: 1;
    at: #'ObexTestObject1' put: 1;
    at: #'ObexTestObject2' put: 2;
    at: #'ObexTestObject3' put: 3;
    at: #'ObexTestObjectArray' put: 7;
    at: #'ObexTestObjectByte' put: 3;
    at: #'ObexTestResource' put: 1;
    yourself.
  classNameMap
    keysAndValuesDo: [ :className :instances | self assert: (instanceCountMap at: className) = instances size ] ]
    ensure: [ PersistentRoot simpleLeaves: leaves ]