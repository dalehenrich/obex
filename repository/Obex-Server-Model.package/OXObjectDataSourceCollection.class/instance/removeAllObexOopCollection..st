double dispatching
removeAllObexOopCollection: aCollection
  aCollection do: [ :each | self remove: each ].
  ^ self