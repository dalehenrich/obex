double dispatching
removeFromObexOopCollection: aCollection
  aCollection do: [ :each | self remove: (Object _objectForOop: each) ].
  ^ self