analysis
findAllReferencePathsToObjects: objects limitObjArray: limitArray printToLog: aBool maxPaths: maxPaths
  self
    searchResult:
      (SystemRepository
        findAllReferencePathsToObjects: objects
        limitObjArray: limitArray
        printToLog: aBool
        maxPaths: maxPaths).
  self analyze