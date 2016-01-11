node callbacks
calculateParentsFor: anOXNode
  | ds objectArray limitArray searchObject |
  System commit.
  searchObject := Object _objectForOop: anOXNode oop.
  objectArray := {searchObject}.
  limitArray := OXReferencePathDataStore minLimitSetForRefPathScan.
  objectArray do: [ :each | limitArray remove: each ifAbsent: [  ] ].
  ds := self class new
    findAllReferencePathsToObjects: objectArray
      limitObjArray: limitArray
      printToLog: false
      maxPaths: 5;
    yourself.
  self oopToNodeMap at: searchObject asOop put: anOXNode.
  (ds searchObjectMap at: searchObject)
    do: [ :ar | self analyzeReferenceArray: ar node: anOXNode nodeRef: {} ]