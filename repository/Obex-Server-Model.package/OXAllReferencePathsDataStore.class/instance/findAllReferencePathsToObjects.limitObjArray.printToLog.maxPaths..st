node callbacks
findAllReferencePathsToObjects: objects limitObjArray: limitArray printToLog: aBool maxPaths: maximumPaths
  excludedArray := TransientValue
    value: (limitArray reject: [ :each | objects includes: each ]).
  maxPaths := maximumPaths.
  System commit.
  self
    searchResult:
      (SystemRepository
        findAllReferencePathsToObjects: objects
        limitObjArray: excludedArray value
        printToLog: aBool
        maxPaths: maxPaths).
  self analyze