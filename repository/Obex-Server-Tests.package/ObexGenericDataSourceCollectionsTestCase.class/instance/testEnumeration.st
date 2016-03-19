tests
testEnumeration
  | baseCollection collections baseCollectionOops |
  baseCollection := {(Object new).
  (Object new)}.
  baseCollectionOops := baseCollection collect: [ :each | each asOop ].
  collections := self createClassInstancesFrom: baseCollection.
  collections
    do: [ :coll1 | 
      coll1 do: [ :each | self assert: (baseCollection includes: each) ].
      coll1
        doAsOops: [ :each | self assert: (baseCollectionOops includes: each) ] ]