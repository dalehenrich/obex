enumerating
doAsOops: aBlock
  "enumerate as oops"

  ^ _collection do: [ :each | aBlock value: each asOop ]