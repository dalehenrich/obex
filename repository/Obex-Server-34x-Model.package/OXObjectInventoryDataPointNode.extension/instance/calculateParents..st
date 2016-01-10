*obex-server-34x-model
calculateParents: parentNodeType
  | newParents dataStore classInstanceCountsAndInstances referencesResult referencesSet classInstanceMap classSamplesMap sortedArray |
  dataStore := OXListReferencesDataStore new
    maxThreads: self maxThreads;
    maxCpuUsage: self maxCpuUsage;
    yourself.
  sortedArray := (dataPoint samples
    collect: [ :each | Object _objectForOop: each ])
    sorted: [ :a :b | a asOop < b asOop ].
  System commit.
  referencesResult := SystemRepository
    _listReferencesWithMaxThreads: self maxThreads
    waitForLock: 60
    pageBufSize: 8
    percentCpuActiveLimit: self maxCpuUsage
    targets: sortedArray
    withLimit: 0.
  referencesSet := IdentitySet new.
  referencesResult do: [ :referenceAr | referencesSet addAll: referenceAr ].
  classInstanceMap := IntegerKeyValueDictionary new.
  classSamplesMap := IntegerKeyValueDictionary new.
  referencesSet
    do: [ :inst | 
      | classOop cnt set |
      classOop := inst class asOop.
      cnt := classInstanceMap at: classOop ifAbsentPut: [ 0 ].
      classInstanceMap at: classOop put: cnt + 1.
      set := classSamplesMap at: classOop ifAbsentPut: [ IdentitySet new ].
      set add: inst asOop.
      System commit ].
  dataStore
    classInstanceMap: classInstanceMap;
    classInstanceCountInstanceMap: classSamplesMap.
  classInstanceCountsAndInstances := dataStore sortedClassInstanceCountList.
  classInstanceCountsAndInstances := classInstanceCountsAndInstances
    copyFrom: 1
    to: (self parentLimit min: classInstanceCountsAndInstances size).
  newParents := classInstanceCountsAndInstances
    collect: [ :dp | 
      (OXObjectInventoryDataPointNode
        for: dp
        nodeType: parentNodeType
        label: dp printString)
        parentLimit: self parentLimit;
        dataSource: dataStore;
        yourself ].
  System commit.
  {sortedArray.
  referencesResult.
  newParents.
  dataStore} inspect.
  ^ newParents asArray