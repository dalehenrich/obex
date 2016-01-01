other
classes
  Classes notNil
    ifTrue: [ ^ Classes ].
  Classes := IntegerKeyValueDictionary new.
  self scanClasses: Classes.
  ^ Classes