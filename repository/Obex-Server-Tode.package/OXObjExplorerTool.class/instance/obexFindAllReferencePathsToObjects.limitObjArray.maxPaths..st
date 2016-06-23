obex referencePaths
obexFindAllReferencePathsToObjects: objects limitObjArray: limitArray maxPaths: maxPaths
  | result |
  result := OXAllReferencePathsDataStore new
    findAllReferencePathsToObjects: objects
    limitObjArray: limitArray
    printToLog: true
    maxPaths: maxPaths.
  ^ result pushOnStack: #'referencePaths' in: self obexDataStoreRoot