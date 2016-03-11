tests
testSimple
  | tool leaves dataStore limitArray oopToNodeMap searchNodeMap refPathMap |
  PersistentRoot := ObexTestResource current.
  leaves := PersistentRoot simpleLeaves.
  System commit.
  tool := self obexTool.
  limitArray := tool obexMinLimitSetForRefPathScan.
  limitArray add: PersistentRoot.
  tool
    obexFindAllReferencePathsToObjects: leaves asArray
    limitObjArray: limitArray.
  dataStore := tool obexDataStoreRoot referencePaths top.
  oopToNodeMap := dataStore oopToNodeMap.
  searchNodeMap := dataStore searchNodeMap.
  refPathMap := Dictionary new
    at: #'ObexTestObjectByte'
      put:
        #('ObexTestResource, [1::0]' 'ObexTestObject, [2::1]' 'ObexTestObjectArray, [3::1]' 'ObexTestObjectByte, [0::1]');
    at: #'ObexTestObject1'
      put:
        #('ObexTestResource, [1::0]' 'ObexTestObject, [2::1]' 'ObexTestObjectArray, [6::1]' 'ObexTestObject1, [0::1]');
    at: #'ObexTestObject2'
      put:
        #('ObexTestResource, [1::0]' 'ObexTestObject, [2::1]' 'ObexTestObjectArray, [6::1]' 'ObexTestObject2, [0::1]');
    at: #'ObexTestObject3'
      put:
        #('ObexTestResource, [1::0]' 'ObexTestObject, [2::1]' 'ObexTestObjectArray, [6::1]' 'ObexTestObject3, [0::1]');
    yourself.
  leaves
    do: [ :leaf | 
      | node refPathPrintStrings |
      node := oopToNodeMap at: leaf asOop.
      refPathPrintStrings := (searchNodeMap at: node) first
        collect: [ :each | each testPrintString ].
      self assert: (refPathMap at: node className) = refPathPrintStrings ].
  self halt