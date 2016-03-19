tests
testCreation
  | baseCollection |
  baseCollection := {(Object new).
  (Object new)}.
  self classesAndCollectionClasses
    do: [ :ar | 
      | class collectionClass collection |
      class := ar at: 1.
      collectionClass := ar at: 2.
      collection := class from: baseCollection.
      self assert: collection _collection class == collectionClass ]