private
calculateParents
  | ds objectArray limitArray searchObject |
  System commit.
  searchObject := Object _objectForOop: self oop.
  objectArray := {searchObject}.
  limitArray := OXReferencePathDataStore minLimitSetForRefPathScan.
  objectArray do: [ :each | limitArray remove: each ifAbsent: [  ] ].
  ds := OXReferencePathDataStore new
    findAllReferencePathsToObjects: objectArray
      limitObjArray: limitArray
      printToLog: false
      maxPaths: 5;
    yourself.
  self referencePathDataStore oopToNodeMap at: searchObject asOop put: self.
  (ds searchObjectMap at: searchObject)
    do: [ :ar | self referencePathDataStore analyzeReferenceArray: ar node: self nodeRef: {} ]