*obex-server-34x-tode
obexSpectroInstances: instances excludedArray: excludedArray srcDataStore: srcDataStore
  | classOopToDataPointMap classOopToInstancesMap |
  srcDataStore excludedArray: excludedArray.
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
        byteCount:
            (samples
                inject: 0
                into: [ :sum :oop | sum + (Object _objectForOop: oop) physicalSizeOnDisk ]);
        instanceCount: samples size;
        samples: samples ]