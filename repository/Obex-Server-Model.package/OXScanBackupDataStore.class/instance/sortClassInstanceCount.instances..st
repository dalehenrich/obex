util
sortClassInstanceCount: classInstanceCountMap instances: classInstanceCountInstanceMap
  | sortedList |
  sortedList := SortedCollection
    sortBlock: [ :a :b | a instanceCount > b instanceCount ].
  classInstanceCountMap
    keysAndValuesDo: [ :classOop :instanceCount | 
      | samples class |
      samples := classInstanceCountInstanceMap at: classOop ifAbsent: [ #() ].
      class := classOopToClassMap
        at: classOop
        ifAbsent: [ classOop printString ].
      sortedList
        add:
          (OXClassInstanceDataPoint new
            className: class name;
            instanceCount: instanceCount;
            samples: samples;
            yourself) ].
  sortedList := sortedList asArray.
  ^ sortedList