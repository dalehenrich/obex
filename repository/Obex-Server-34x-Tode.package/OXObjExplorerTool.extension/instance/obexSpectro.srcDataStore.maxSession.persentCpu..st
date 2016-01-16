*obex-server-34x-tode
obexSpectro: classArray srcDataStore: srcDataStore maxSession: maxSessions persentCpu: percentCpu
  | classInstanceCountArray classOopToDataPointMap resultInstances classOopToInstancesMap |
  System commit.
  classInstanceCountArray := SystemRepository
    listInstancesToHiddenSet: classArray
    withMaxThreads: maxSessions
    maxCpuUsage: percentCpu.
  resultInstances := System hiddenSetAsArray: 1.
  classOopToDataPointMap := srcDataStore classOopToDataPointMap.
  classOopToInstancesMap := IntegerKeyValueDictionary new.
  resultInstances
    do: [ :obj | 
      | samples |
      samples := classOopToInstancesMap
        at: obj class asOop
        ifAbsentPut: [ Array new ].
      samples add: obj asOop ].
  1 to: classInstanceCountArray size by: 2 do: [ :index | 
    | classOop instanceCount samples |
    classOop := (classInstanceCountArray at: index) asOop.
    instanceCount := classInstanceCountArray at: index + 1.
    (classOopToDataPointMap at: classOop)
      samples: (classOopToInstancesMap at: classOop ifAbsent: [ {} ]) ]