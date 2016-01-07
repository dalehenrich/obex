accessing
classOopToClassMap
  classOopToClassMap
    ifNil: [ classOopToClassMap := IntegerKeyValueDictionary new ].
  ^ classOopToClassMap