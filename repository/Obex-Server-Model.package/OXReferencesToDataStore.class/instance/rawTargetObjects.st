accessing
rawTargetObjects
  targetObjects ifNil: [ targetObjects := TransientValue value: nil ].
  ^ targetObjects