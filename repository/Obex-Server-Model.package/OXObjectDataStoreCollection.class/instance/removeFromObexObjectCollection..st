double dispatching
removeFromObexObjectCollection: aCollection
  aCollection do: [ :each | self remove: each ].
  ^ self