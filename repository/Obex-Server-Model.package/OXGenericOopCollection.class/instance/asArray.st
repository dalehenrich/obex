accessing
asArray
  "array of objects"

  ^ (_collection collect: [ :each | Object _objectForOop: each ]) asArray