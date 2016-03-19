tests
testTesting
  | baseCollection collections obj |
  baseCollection := {}.
  collections := self createClassInstancesFrom: baseCollection.
  collections do: [ :coll | self assert: coll isEmpty ].
  baseCollection := {(Object new).
  (Object new)}.
  collections := self createClassInstancesFrom: baseCollection.
  obj := baseCollection at: 1.
  collections
    do: [ :coll1 | 
      self assert: coll1 size = 2.
      self assert: (coll1 includes: obj).
      self assert: (coll1 equals: baseCollection).
      collections do: [ :coll2 | self assert: (coll1 equals: coll2) ] ]