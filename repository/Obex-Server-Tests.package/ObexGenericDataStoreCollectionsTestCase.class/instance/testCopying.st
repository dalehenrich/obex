tests
testCopying
  | baseCollection collections |
  baseCollection := {(Object new).
  (Object new)}.
  collections := self createClassInstancesFrom: baseCollection.
  collections
    do: [ :coll1 | 
      collections
        do: [ :coll2 | 
          | copy |
          copy := coll1 copy.
          self assert: (copy isKindOf: OXObjectDataStoreCollection).
          self assert: (copy equals: coll2).
          self assert: (coll1 equals: coll2) ] ]