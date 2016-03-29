analysis
rawFindRefPathsParentsOfObjects: objects withMaxThreads: maxSessions maxCpuUsage: maxPercentCpu
  | result |
  System commit.
  SystemRepository
    _refPathSetupScanWithMaxThreads: maxSessions
    waitForLock: 3
    pageBufSize: 8
    percentCpuLimit: maxPercentCpu.
  SystemRepository
    _refPathDoScanForParents: objects
    excludeParentRefs: self excludedArray
    onlySearchObjs: true.
  result := objects
    collect: [ :anObject | SystemRepository _refPathParentsOf: anObject ].
  SystemRepository refPathCleanup.
  ^ result