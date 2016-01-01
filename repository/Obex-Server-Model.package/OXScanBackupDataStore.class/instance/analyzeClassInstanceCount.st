instance count analysis
analyzeClassInstanceCount
  sortedClassInstanceCountList := SortedCollection
    sortBlock: [ :a :b | a instanceCount > b instanceCount ].
  classInstanceCount
    keysAndValuesDo: [ :classOop :instanceCount | 
      | samples class |
      samples := classInstanceCountAndInstances at: classOop ifAbsent: [ #() ].
      class := classOopToClassMap
        at: classOop
        ifAbsent: [ classOop printString ].
      sortedClassInstanceCountList
        add:
          (OXClassInstanceDataPoint new
            className: class name;
            instanceCount: instanceCount;
            samples: samples;
            yourself) ].
  sortedClassInstanceCountList := sortedClassInstanceCountList asArray.
  self summary at: 'classes' put: sortedClassInstanceCountList size