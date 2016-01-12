node callbacks
calculateParentsOfOXNode: anOXNode
  | ds objects searchObject results |
  System commit.
  searchObject := Object _objectForOop: anOXNode oop.
  objects := {searchObject}.
  results := self class new rawFindRefPathsParentsOfObjects: objects.
  self oopToNodeMap at: searchObject asOop put: anOXNode.
  results do: [ :ar | self analyzeReferenceArray: (ar at: 4) node: anOXNode ]