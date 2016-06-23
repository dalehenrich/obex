node callbacks
allReferencePathsToObjects: objects limits: limitArray printToLog: aBool maxPaths: maximumPaths
  excludedArray := TransientValue
    value: (limitArray reject: [ :each | objects includes: each ]).
  maxPaths := maximumPaths.
  System commit.
  self
    searchResult:
      (SystemRepository
        allReferencePathsToObjects: objects
        limits: excludedArray value
        printToLog: aBool
        maxPaths: maxPaths).
  self analyze