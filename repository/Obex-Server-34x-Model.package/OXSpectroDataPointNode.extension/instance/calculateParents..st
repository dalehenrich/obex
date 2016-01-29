*obex-server-34x-model
calculateParents: parentNodeType
  | newParents dataStore list referencesResult referencesSet classInstanceMap classSamplesMap objects labelSelector listSelector parentsOfResult processedOops |
  self sortKey = 'instances'
    ifTrue: [ 
      labelSelector := #'instanceCount'.
      listSelector := #'sortedClassInstanceCountList' ]
    ifFalse: [ 
      labelSelector := #'byteCount'.
      listSelector := #'sortedClassByteCountList' ].
  dataStore := OXSpectroDataStore new
    maxThreads: self maxThreads;
    maxCpuUsage: self maxCpuUsage;
    yourself.
  objects := dataPoint samples collect: [ :each | Object _objectForOop: each ].
  System commit.
  SystemRepository
    _refPathSetupScanWithMaxThreads: 1
    waitForLock: 3
    pageBufSize: 8
    percentCpuLimit: 90.
  SystemRepository
    _refPathDoScanForParents: objects asArray
    excludeParentRefs: self exludedParentsArray
    onlySearchObjs: true.
  parentsOfResult := objects
    collect: [ :anObject | SystemRepository _refPathParentsOf: anObject ].
  SystemRepository refPathCleanup.
  classInstanceMap := IntegerKeyValueDictionary new.
  classSamplesMap := IntegerKeyValueDictionary new.
  processedOops := IdentitySet new.
  parentsOfResult
    do: [ :parentsInfo | 
      | parentOops parentClassOop parentPhysSize |
      parentOops := parentsInfo parentOops.
      parentClassOop := parentsInfo parentClassOops.
      parentPhysSize := parentsInfo parentSizesInBytes.
      1 to: parentOops size do: [ :index | 
        | parentOop classOop cnt set |
        parentOop := parentOops at: index.
        (processedOops includes: parentOop)
          ifFalse: [ 
            classOop := parentClassOop at: index.
            cnt := classInstanceMap at: classOop ifAbsentPut: [ 0 ].
            classInstanceMap at: classOop put: cnt + 1.
            set := classSamplesMap at: classOop ifAbsentPut: [ IdentitySet new ].
            set add: (parentOops at: index).
            processedOops add: parentOop ] ].
      System commit ].
  dataStore
    classInstanceMap: classInstanceMap;
    classInstanceCountInstanceMap: classSamplesMap.
  list := dataStore perform: listSelector.
  list := list copyFrom: 1 to: (self parentLimit min: list size).
  newParents := list
    collect: [ :dp | 
      | lbl |
      lbl := dp theClassLabel , ', ' , (dp perform: labelSelector) printString.
      (self class for: dp nodeType: parentNodeType label: lbl)
        parentLimit: self parentLimit;
        dataSource: dataStore;
        sortKey: self sortKey;
        yourself ].
  System commit.
  parents := newParents asArray