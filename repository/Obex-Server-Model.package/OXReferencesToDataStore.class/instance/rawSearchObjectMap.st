accessing
rawSearchObjectMap
  searchObjectMap ifNil: [ searchObjectMap := TransientValue value: nil ].
  ^ searchObjectMap