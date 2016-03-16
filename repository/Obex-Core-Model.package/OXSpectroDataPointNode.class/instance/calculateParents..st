private
calculateParents: parentNodeType
  | newParents dataStore list referencesResult referencesSet classInstanceMap classSamplesMap objects labelSelector listSelector parentsOfResult |
  self sortKey = 'instances'
    ifTrue: [ 
      labelSelector := #'instanceCount'.
      listSelector := #'sortedClassInstanceCountList' ]
    ifFalse: [ 
      labelSelector := #'byteCount'.
      listSelector := #'sortedClassByteCountList' ].
  dataStore := OXSpectroDataStore new
    excludedArray: self exludedParentsArray;
    maxThreads: self maxThreads;
    maxCpuUsage: self maxCpuUsage;
    yourself.
  objects := dataPoint samples value asArray.
  System commit.
  SystemRepository
    _refPathSetupScanWithMaxThreads: 1
    waitForLock: 3
    pageBufSize: 8
    percentCpuLimit: 90.
  SystemRepository
    _refPathDoScanForParents: objects
    excludeParentRefs: self exludedParentsArray
    onlySearchObjs: true.
  parentsOfResult := objects
    collect: [ :anObject | SystemRepository _refPathParentsOf: anObject ].
  SystemRepository refPathCleanup.
  classInstanceMap := IntegerKeyValueDictionary new.
  classSamplesMap := IntegerKeyValueDictionary new.
  parentsOfResult
    do: [ :parentsInfo | 
      | parentOopsBitmap |
      parentOopsBitmap := parentsInfo parentOops copy.
      parentOopsBitmap
        do: [ :parent | 
          | classOop cnt set |
          classOop := parent class asOop.
          cnt := classInstanceMap at: classOop ifAbsentPut: [ 0 ].
          classInstanceMap at: classOop put: cnt + 1.
          set := (classSamplesMap
            at: classOop
            ifAbsentPut: [ TransientValue value: GsBitmap new ]) value.
          set add: parent ].
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