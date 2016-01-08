private
sortClassInstanceCount: inventoryMap
  | sortedList |
  sortedList := SortedCollection
    sortBlock: [ :a :b | a instanceCount > b instanceCount ].
  inventoryMap
    keysAndValuesDo: [ :classOop :dataPoint | sortedList add: dataPoint ].
  sortedList := sortedList asArray.
  ^ sortedList