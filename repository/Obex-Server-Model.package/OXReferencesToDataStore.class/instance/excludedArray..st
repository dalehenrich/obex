accessing
excludedArray: anObject
  excludedArray := anObject asIdentitySet.	"more efficient for our purposes"
  false
    ifTrue: [ 
      self inMemory
        ifTrue: [ 
          "TransientValue does not protect against in memory references, so add the TransientValue ivs to excludedArray"
          excludedArray
            add: self rawSearchObjectMap;
            add: self rawTargetObjects;
            add: self rawSearchResult ] ]