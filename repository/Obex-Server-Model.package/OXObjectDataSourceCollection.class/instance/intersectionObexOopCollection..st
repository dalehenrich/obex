double dispatching
intersectionObexOopCollection: aCollection
  | coll |
  coll := self class new.
  self
    do: [ :each | 
      (aCollection includes: each)
        ifTrue: [ coll add: each ] ].
  ^ coll