double dispatching
copyFromObexObjectCollection: aCollection
  aCollection do: [ :each | self add: each ].
  ^ self