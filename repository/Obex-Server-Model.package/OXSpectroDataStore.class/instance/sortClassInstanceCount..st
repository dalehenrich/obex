private
sortClassInstanceCount: classInstanceCountMap
  | sortedList |
  sortedList := SortedCollection
    sortBlock: [ :a :b | a instanceCount > b instanceCount ].
  classInstanceCountMap
    keysAndValuesDo: [ :classOop :instanceCount | 
      | class |
      class := Object _objectForOop: classOop.
      class ifNil: [ self halt ].
      sortedList
        add:
          (OXObjectInventoryDataPoint new
            className: class name;
            classOop: classOop;
            instanceCount: instanceCount;
            samples: (classInstanceCountInstanceMap at: classOop);
            yourself) ].
  sortedList := sortedList asArray.
  ^ sortedList