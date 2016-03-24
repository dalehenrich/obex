analysis
findRefPathsParentsOfObjects: objects
  | result |
  result := self rawFindRefPathsParentsOfObjects: objects.
  self searchResult: result.
  self analyze.
  objects
    do: [ :each | 
      | node |
      "searchNodeMap keys used to prime view with initial objects"
      node := self oopToNodeMap at: each asOop.
      searchNodeMap at: node put: #() ]