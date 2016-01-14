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
    excludeParentRefs: #().
  parentsOfResult := objects
    collect: [ :anObject | 
      | ar |
      ar := (SystemRepository _refPathParentsOf: anObject) , {(anObject asOop)}.
      (ar at: 3)
        ifTrue: [ 
          "more parents"
          self halt ].
      ar ].
  SystemRepository refPathCleanup.
  classInstanceMap := IntegerKeyValueDictionary new.
  classSamplesMap := IntegerKeyValueDictionary new.
  processedOops := IdentitySet new.
  parentsOfResult
    do: [ :ar | 
      | parentOops parentClassOop parentPhysSize |
      parentOops := ar at: 4.
      parentClassOop := ar at: 5.
      parentPhysSize := ar at: 6.
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