private
calculateParents: parentNodeType
  | newParents dataStore classInstanceCountsAndInstances referencesResult referencesSet classInstanceMap classSamplesMap |
  dataStore := OXListReferencesDataStore new
    maxThreads: self maxSessions;
    maxCpuUsage: self percentCpu;
    yourself.
  referencesResult := SystemRepository
    listReferences: dataPoint samples
    withLimit: 0
    withMaxThreads: self maxThreads
    maxCpuUsage: self maxCpuUsage.
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
      set add: inst asOop ].
  dataStore classInstanceMap: classInstanceMap.
  classInstanceCountsAndInstances := dataStore sortedClassInstanceCountList.
  self parentLimit < classInstanceCountsAndInstances size
    ifTrue: [ self parentLimit to: classInstanceCountsAndInstances size do: [ :index | (classInstanceCountsAndInstances at: index) samples: nil ] ].
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
  ^ newParents asArray