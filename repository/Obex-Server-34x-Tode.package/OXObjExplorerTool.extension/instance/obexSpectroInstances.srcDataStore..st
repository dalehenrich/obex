*obex-server-34x-tode
obexSpectroInstances: instances srcDataStore: srcDataStore
  | classOopToDataPointMap classOopToInstancesMap |
  classOopToDataPointMap := srcDataStore classOopToDataPointMap.
  classOopToInstancesMap := IntegerKeyValueDictionary new.
  instances
    do: [ :obj | 
      | samples |
      samples := classOopToInstancesMap
        at: obj class asOop
        ifAbsentPut: [ Array new ].
      samples add: obj asOop ].
  classOopToInstancesMap
    keysAndValuesDo: [ :classOop :samples | 
      | dp |
      dp := classOopToDataPointMap at: classOop.
      dp
        instanceCount: samples size;
        samples: samples ]