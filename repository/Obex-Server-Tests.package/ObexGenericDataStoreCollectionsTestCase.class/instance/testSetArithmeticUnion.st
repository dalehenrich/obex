tests
testSetArithmeticUnion
  | baseCollection1 commonObj collections1 baseCollection2 collections2 baseUnion |
  baseCollection1 := {(Object new).
  (Object new)}.
  commonObj := baseCollection1 at: 1.
  collections1 := self createClassInstancesFrom: baseCollection1.
  baseCollection2 := {(Object new).
  (Object new)}.
  collections2 := self createClassInstancesFrom: baseCollection2.
  baseUnion := baseCollection1 , baseCollection2.
  collections1
    do: [ :coll1 | 
      collections2
        do: [ :coll2 | 
          | union |
          union := coll1 union: coll2.
          self assert: (union isKindOf: OXObjectDataStoreCollection).
          self assert: (union equals: baseUnion).
          union := coll2 union: coll1.
          self assert: (union isKindOf: OXObjectDataStoreCollection).
          self assert: (union equals: baseUnion) ] ]