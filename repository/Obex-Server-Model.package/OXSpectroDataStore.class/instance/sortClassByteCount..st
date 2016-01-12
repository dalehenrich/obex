private
sortClassByteCount: inventoryMap
  | sortedList |
  sortedList := SortedCollection
    sortBlock: [ :a :b | a byteCount > b byteCount ].
  inventoryMap
    keysAndValuesDo: [ :classOop :dataPoint | sortedList add: dataPoint ].
  sortedList := sortedList asArray.
  ^ sortedList