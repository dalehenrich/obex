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
          self assert: (coll1 copy equals: coll2).
          self assert: (coll1 equals: coll2) ] ]