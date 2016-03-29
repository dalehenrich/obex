obex all referencePaths
obexFindAllReferencePathsToObjects: objects limitObjArray: limitArray
  ^ self
    obexFindAllReferencePathsToObjects: objects
    limitObjArray: limitArray
    maxPaths: self obexDefaultMaxPaths