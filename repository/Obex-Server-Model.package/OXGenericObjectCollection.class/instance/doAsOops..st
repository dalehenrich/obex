enumerating
doAsOops: aBlock
  "enumerate as oops"

  ^ self _collection do: [ :each | aBlock value: each asOop ]