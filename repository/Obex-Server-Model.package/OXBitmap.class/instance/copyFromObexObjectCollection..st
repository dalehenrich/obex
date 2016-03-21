double dispatching
copyFromObexObjectCollection: aCollection
  aCollection isArray
    ifFalse: [ ^ super copyFromObexObjectCollection: aCollection ].
  self _collection addAll: aCollection.
  ^ self