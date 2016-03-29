obex all referencePaths
obexFindAllReferencePathsToObjects: objects limitObjArray: limitArray maxPaths: maxPaths
  | result |
  result := OXAllReferencePathsDataStore new
    findAllReferencePathsToObjects: objects
    limitObjArray: limitArray
    printToLog: false
    maxPaths: maxPaths.
  ^ result pushOnStack: #'referencePaths' in: self obexDataStoreRoot