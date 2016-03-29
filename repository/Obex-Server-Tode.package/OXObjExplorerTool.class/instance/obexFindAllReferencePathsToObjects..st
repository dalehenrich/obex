obex all referencePaths
obexFindAllReferencePathsToObjects: objects
  ^ self
    obexFindAllReferencePathsToObjects: objects
    limitObjArray: OXAllReferencePathsDataStore minLimitSetForRefPathScan
    maxPaths: self obexDefaultMaxPaths