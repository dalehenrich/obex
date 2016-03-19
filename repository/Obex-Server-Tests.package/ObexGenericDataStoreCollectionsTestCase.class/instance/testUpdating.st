tests
testUpdating
  | baseCollection collections newObj newCollection collections2 |
  baseCollection := {(Object new).
  (Object new)}.
  collections := self createClassInstancesFrom: baseCollection.
  newObj := Object new.
  collections
    do: [ :coll | 
      | obj |
      obj := coll add: newObj.
      self assert: obj == newObj.
      self assert: (coll includes: newObj).
      obj := coll remove: newObj.
      self assert: obj == newObj.
      self deny: (coll includes: newObj) ].
  newCollection := {(Object new)}.
  newObj := newCollection at: 1.
  collections
    do: [ :coll | 
      | ans |
      ans := coll addAll: newCollection.
      self assert: ans == newCollection.
      self assert: (coll includes: newObj).
      ans := coll removeAll: newCollection.
      self assert: ans == newCollection.
      self deny: (coll includes: newObj) ].
  baseCollection := {(Object new).
  (Object new)}.
  collections2 := self createClassInstancesFrom: baseCollection.
  newObj := baseCollection at: 1.
  collections
    do: [ :coll | 
      collections2
        do: [ :coll2 | 
          coll addAll: coll2.
          self assert: (coll includes: newObj).
          coll removeAll: coll2.
          self deny: (coll includes: newObj) ] ]