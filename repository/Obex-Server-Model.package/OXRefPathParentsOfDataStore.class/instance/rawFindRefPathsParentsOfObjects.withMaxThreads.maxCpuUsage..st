analysis
rawFindRefPathsParentsOfObjects: objects withMaxThreads: maxSessions maxCpuUsage: maxPercentCpu
  | result |
  System commit.
  GsSingleRefPathFinder
    _refPathSetupScanWithMaxThreads: maxSessions
    waitForLock: 3
    pageBufSize: 8
    percentCpuLimit: maxPercentCpu.
  GsSingleRefPathFinder
    _refPathDoScanForParents: objects
    excludeParentRefs: self excludedArray
    onlySearchObjs: self onlySearchObjects.
  result := objects
    collect: [ :anObject | GsReferencePathParentsInfo _refPathParentsOf: anObject ].
  self refPathCleanup.
  ^ result