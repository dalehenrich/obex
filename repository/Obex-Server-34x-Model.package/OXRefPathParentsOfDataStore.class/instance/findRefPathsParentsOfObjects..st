analysis
findRefPathsParentsOfObjects: objects
  System commit.
  SystemRepository
    _refPathSetupScanWithMaxThreads: 1
    waitForLock: 3
    pageBufSize: 8
    percentCpuLimit: 90.
  SystemRepository _refPathDoScanForParents: objects excludeParentRefs: #().
  objects
    do: [ :anObject | 
      | result |
      result := SystemRepository _refPathParentsOf: anObject.
      self halt ]