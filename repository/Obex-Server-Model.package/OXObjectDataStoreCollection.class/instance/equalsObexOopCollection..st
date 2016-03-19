double dispatching
equalsObexOopCollection: aCollection
  aCollection size = self size
    ifFalse: [ ^ false ].
  self
    do: [ :each | 
      (aCollection includes: each asOop)
        ifFalse: [ ^ false ] ].
  ^ true