tests
testSetArithmeticIntersection
  | baseCollection1 commonObj collections1 baseCollection2 collections2 |
  baseCollection1 := {(Object new).
  (Object new)}.
  commonObj := baseCollection1 at: 1.
  collections1 := self createClassInstancesFrom: baseCollection1.
  baseCollection2 := {(Object new).
  (Object new)}.
  collections2 := self
    createClassInstancesFrom: baseCollection1 , baseCollection2.
  collections1
    do: [ :coll1 | 
      collections2
        do: [ :coll2 | 
          | intersection |
          intersection := coll1 intersection: coll2.
          self assert: (intersection equals: baseCollection1).
          intersection := coll2 intersection: coll1.
          self assert: (intersection equals: baseCollection1) ] ]