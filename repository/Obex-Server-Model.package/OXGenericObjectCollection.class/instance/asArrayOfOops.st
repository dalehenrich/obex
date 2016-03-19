accessing
asArrayOfOops
  "array of oops"

  ^ (_collection collect: [ :each | each asOop ]) asArray