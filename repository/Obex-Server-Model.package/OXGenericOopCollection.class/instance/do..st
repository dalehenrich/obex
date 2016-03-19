enumerating
do: aBlock
  "enumerate as objects"

  ^ _collection do: [ :each | aBlock value: (Object _objectForOop: each) ]