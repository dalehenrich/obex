actions
inspectOXObject
  self isCacheValid
    ifFalse: [ 
      self
        error:
          'The object cache has expired and inspect results will be unreliable.' ].
  (Object _objectForOop: self oop) inspect.
  ^ nil