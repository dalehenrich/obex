obex referencePaths
obexAllReferencePathsToObjects: objects limits: limitArray maxPaths: maxPaths
  | result |
  result := OXAllReferencePathsDataStore new
    allReferencePathsToObjects: objects
    limits: limitArray
    printToLog: false
    maxPaths: maxPaths.
  ^ result pushOnStack: #'referencePaths' in: self obexDataStoreRoot