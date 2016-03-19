double dispatching
copyFromObexOopCollection: aCollection
  aCollection do: [ :each | self add: (Object _objectForOop: each) ].
  ^ self