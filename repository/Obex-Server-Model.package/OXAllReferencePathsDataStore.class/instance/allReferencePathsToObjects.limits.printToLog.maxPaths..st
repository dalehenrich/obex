node callbacks
allReferencePathsToObjects: objects limits: limitArray printToLog: aBool maxPaths: maximumPaths
  excludedArray := limitArray reject: [ :each | objects includes: each ].
  maxPaths := maximumPaths.
  System commit.
  self
    searchResult:
      (SystemRepository
        allReferencePathsToObjects: objects
        limits: excludedArray
        printToLog: aBool
        maxPaths: maxPaths).
  self analyze