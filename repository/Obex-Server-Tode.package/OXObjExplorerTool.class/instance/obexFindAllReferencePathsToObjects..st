obex findAllRefs
obexFindAllReferencePathsToObjects: objects
  self
    obexFindAllReferencePathsToObjects: objects
    limitObjArray: self obexMinLimitSetForRefPathScan
    maxPaths: self obexDefaultObjectInventoryMaxSessions