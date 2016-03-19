double dispatching
differenceObexObjectCollection: aCollection
  | coll |
  coll := self class new.
  self
    do: [ :each | 
      (aCollection includes: each)
        ifFalse: [ coll add: each ] ].
  ^ coll