double dispatching
removeFromObexOopCollection: aCollection
  aCollection do: [ :each | self remove: each ].
  ^ self