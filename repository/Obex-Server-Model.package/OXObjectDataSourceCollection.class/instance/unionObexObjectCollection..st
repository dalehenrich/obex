double dispatching
unionObexObjectCollection: aCollection
  | coll |
  coll := self copy.
  aCollection
    do: [ :each | 
      (self includes: each)
        ifFalse: [ coll add: each ] ].
  ^ coll