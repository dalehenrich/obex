accessing
excludedArray: anObject
  excludedArray := anObject.
  false
    ifTrue: [ 
      self inMemory
        ifTrue: [ 
          "TransientValue does not protect against in memory references, so add the TransientValue ivs to excludedArray"
          excludedArray
            add: self rawSearchObjectMap;
            add: self rawTargetObjects;
            add: self rawSearchResult;
            add: anObject;
            add: excludedArray ] ]