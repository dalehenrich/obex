analysis
findAllReferencePathsToObjects: objects limitObjArray: limitArray printToLog: aBool maxPaths: maxPaths
  self
    searchResult:
      (SystemRepository
        findAllReferencePathsToObjects: objects
        limitObjArray: limitArray
        printToLog: aBool
        maxPaths: maxPaths).
  self analyze.
  objects
    do: [ :each | 
      | node |
      "searchNodeMap keys used to prime view with initial objects"
      node := self oopToNodeMap at: each asOop.
      searchNodeMap at: node put: #() ]