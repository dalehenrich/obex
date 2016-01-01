accessing
classOopToClassMap
  classOopToClassMap
    ifNil: [ 
      classOopToClassMap := IntegerKeyValueDictionary new.
      ScanBackup scanClasses: classOopToClassMap ].
  ^ classOopToClassMap