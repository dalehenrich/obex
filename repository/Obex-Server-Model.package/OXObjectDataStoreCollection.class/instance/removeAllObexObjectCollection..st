double dispatching
removeAllObexObjectCollection: aCollection
  aCollection do: [ :each | self remove: each ].
  ^ self