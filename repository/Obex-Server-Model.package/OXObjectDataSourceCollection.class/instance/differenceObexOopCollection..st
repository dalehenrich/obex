double dispatching
differenceObexOopCollection: aCollection
  | coll |
  coll := self class new.
  self
    do: [ :each | 
      (aCollection includes: each)
        ifFalse: [ coll add: each ] ].
  ^ coll