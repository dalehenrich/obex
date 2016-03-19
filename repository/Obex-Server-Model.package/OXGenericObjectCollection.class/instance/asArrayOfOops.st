accessing
asArrayOfOops
  "array of oops"

  ^ (self _collection collect: [ :each | each asOop ]) asArray