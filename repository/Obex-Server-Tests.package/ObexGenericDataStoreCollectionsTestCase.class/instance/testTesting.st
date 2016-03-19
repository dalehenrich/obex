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
    do: [ :coll | 
      self assert: coll size = 2.
      self assert: (coll includes: obj).
      self assert: (coll equals: baseCollection) ]