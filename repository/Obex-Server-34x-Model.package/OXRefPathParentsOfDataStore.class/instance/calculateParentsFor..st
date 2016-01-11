node callbacks
calculateParentsFor: anOXNode
  | ds objects searchObject |
  System commit.
  searchObject := Object _objectForOop: anOXNode oop.
  objects := {searchObject}.
  ds := self class new
    findRefPathsParentsOfObjects: objects
    excludeParentRefs: #().
  self oopToNodeMap at: searchObject asOop put: anOXNode.
  (ds searchObjectMap at: searchObject)
    do: [ :ar | self analyzeReferenceArray: ar node: anOXNode ]