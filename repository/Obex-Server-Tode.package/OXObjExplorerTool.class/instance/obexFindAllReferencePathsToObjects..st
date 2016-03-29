obex referencePaths
obexFindAllReferencePathsToObjects: objects
  ^ self
    obexFindAllReferencePathsToObjects: objects
    limitObjArray: self obexMinLimitSetForRefPathScan
    maxPaths: self obexDefaultMaxPaths