reference paths
findAllReferencePathsToObjects: objects maxPaths: maxPaths
  referencePaths := OXReferencePathDataStore new.
  System commit.
  referencePaths findAllReferencePathsToObjects: objects maxPaths: maxPaths.
  System commit