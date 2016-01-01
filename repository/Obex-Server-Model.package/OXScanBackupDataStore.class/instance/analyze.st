analysis
analyze
  sortedClassInstanceCountList := SortedCollection
    sortBlock: [ :a :b | a instanceCount > b instanceCount ].
  classInstanceCount
    keysAndValuesDo: [ :classOop :instanceCount | 
      | samples className |
      samples := classInstanceCountAndInstances at: classOop ifAbsent: [ #() ].
      className := classOopToClassMap
        at: classOop
        ifAbsent: [ classOop printString ].
      sortedClassInstanceCountList
        add:
          (OXClassInstanceDataPoint new
            className: className;
            instanceCount: instanceCount;
            samples: samples;
            yourself) ].
  sortedClassInstanceCountList := sortedClassInstanceCountList asArray