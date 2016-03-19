double dispatching
equalsObexObjectCollection: aCollection
  aCollection size = self size
    ifFalse: [ ^ false ].
  aCollection
    do: [ :each | 
      (self includes: each)
        ifFalse: [ ^ false ] ].
  ^ true