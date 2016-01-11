node callbacks
calculateParentsOfOXNode: anOXNode
  | ds objects searchObject results |
  Transcript
    cr;
    show: '#calculate: ' , self asOop printString.
  System commit.
  Transcript
    cr;
    show: anOXNode oop printString.
  searchObject := Object _objectForOop: anOXNode oop.
  objects := {searchObject}.
  results := self class new rawFindRefPathsParentsOfObjects: objects.
  self oopToNodeMap at: searchObject asOop put: anOXNode.
  Transcript
    cr;
    show: '#calculate [2]'.
  results do: [ :ar | self analyzeReferenceArray: (ar at: 4) node: anOXNode ]