accessing
excludedArray
  excludedArray
    ifNil: [ 
      "InMemory modifies excludedArray - listeral Array wont' work"
      excludedArray := TransientValue value: {} ].
  ^ excludedArray value