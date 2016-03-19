tests
testUpdating
  | baseCollection collections newObj newCollection |
  baseCollection := {(Object new).
  (Object new)}.
  collections := self createClassInstancesFrom: baseCollection.
  newObj := Object new.
  collections
    do: [ :coll | 
      coll add: newObj.
      self assert: (coll includes: newObj).
      coll remove: newObj.
      self deny: (coll includes: newObj) ].
  newCollection := {(Object new)}.
  newObj := newCollection at: 1.
  collections
    do: [ :coll | 
      coll addAll: newCollection.
      self assert: (coll includes: newObj).
      coll removeAll: newCollection.
      self deny: (coll includes: newObj) ]