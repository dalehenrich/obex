tests
testAccessing
  | baseCollection collections baseCollectionOops |
  baseCollection := {(Object new).
  (Object new)}.
  baseCollectionOops := baseCollection collect: [ :each | each asOop ].
  collections := self createClassInstancesFrom: baseCollection.
  collections
    do: [ :coll | 
      | ar |
      ar := coll asArray.
      self assert: (ar isKindOf: Array).
      ar do: [ :each | self assert: (baseCollection includes: each) ].
      ar := coll asArrayOfOops.
      self assert: (ar isKindOf: Array).
      ar do: [ :each | self assert: (baseCollectionOops includes: each) ] ]