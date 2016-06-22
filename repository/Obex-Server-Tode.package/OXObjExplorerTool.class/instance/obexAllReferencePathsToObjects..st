obex referencePaths
obexAllReferencePathsToObjects: objects
  ^ self
    obexAllReferencePathsToObjects: objects
    limits: OXAllReferencePathsDataStore minLimitSetForRefPathScan
    maxPaths: self obexDefaultMaxPaths