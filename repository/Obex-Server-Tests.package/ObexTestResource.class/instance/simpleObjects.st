accessing
simpleObjects
  | coll |
  coll := {}.
  self simpleData obexDo: [ :each | coll add: each ].
  ^ coll