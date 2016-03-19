double dispatching
copyFromObexOopCollection: aCollection
  aCollection do: [ :each | self add: each ].
  ^ self