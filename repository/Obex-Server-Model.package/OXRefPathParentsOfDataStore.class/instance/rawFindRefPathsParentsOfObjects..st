analysis
rawFindRefPathsParentsOfObjects: objects
  | result |
  System commit.
  SystemRepository
    _refPathSetupScanWithMaxThreads: 1
    waitForLock: 3
    pageBufSize: 8
    percentCpuLimit: 90.
  SystemRepository
    _refPathDoScanForParents: objects
    excludeParentRefs: self excludedArray
    onlySearchObjs: true.
  result := objects
    collect: [ :anObject | SystemRepository _refPathParentsOf: anObject ].
  SystemRepository refPathCleanup.
  ^ result