accessing
excludedArray
  excludedArray ifNil: [ excludedArray := TransientValue value: #() ].
  ^ excludedArray value