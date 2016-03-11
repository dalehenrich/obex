obex findAllRefs
obexFindAllReferencePathsToObjects: objects limitObjArray: limitArray maxPaths: maxPaths
  | result |
  result := OXReferencePathDataStore new
    findAllReferencePathsToObjects: objects
    limitObjArray: limitArray
    printToLog: false
    maxPaths: maxPaths.
  self obexDataStoreRoot referencePaths push: result