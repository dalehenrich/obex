actions
inspectOXObject: topez
  self isCacheValid
    ifFalse: [ 
      self
        error:
          'The object cache has expired and inspect results will be unreliable.' ].
  ^ super inspectOXObject: topez