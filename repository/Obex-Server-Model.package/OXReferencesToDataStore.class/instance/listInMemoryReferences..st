analysis
listInMemoryReferences: objectsArray
  self rawTargetObjects value: objectsArray.
  inMemory := true.
  self searchResult: (self rawListInMemoryReferences: objectsArray).
  self analyze.
  objectsArray
    do: [ :each | 
      | node |
      "searchNodeMap keys used to prime view with initial objects"
      node := self oopToNodeMap at: each asOop.
      searchNodeMap at: node put: #() ]