analysis
findAllReferencePathsToObjects: objects maxPaths: maxPaths
  self
    searchResult:
      (SystemRepository findAllReferencePathsToObjects: objects maxPaths: maxPaths).
  self analyze