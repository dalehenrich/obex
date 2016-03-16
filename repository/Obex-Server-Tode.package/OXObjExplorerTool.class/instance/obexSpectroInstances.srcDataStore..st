obex spectro
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
        byteCount:
            (samples
                inject: 0
                into: [ :sum :oop | sum + (Object _objectForOop: oop) physicalSizeOnDisk ]);
        instanceCount: samples size;
        samples: samples ]