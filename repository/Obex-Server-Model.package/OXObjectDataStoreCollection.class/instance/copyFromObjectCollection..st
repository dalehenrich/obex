double dispatching
copyFromObjectCollection: aCollection
  aCollection do: [ :each | self add: each ].
  ^ self