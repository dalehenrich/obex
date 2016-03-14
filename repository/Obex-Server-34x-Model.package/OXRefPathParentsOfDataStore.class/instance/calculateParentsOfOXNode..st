node callbacks
calculateParentsOfOXNode: anOXNode
  | ds objects searchObject results |
  System commit.
  searchObject := Object _objectForOop: anOXNode oop.
  objects := {searchObject}.
  results := self rawFindRefPathsParentsOfObjects: objects.
  self oopToNodeMap at: searchObject asOop put: anOXNode.
  results
    do: [ :parentsInfo | self analyzeReferenceGsBitmap: parentsInfo parentOops node: anOXNode ]