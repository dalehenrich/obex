node callbacks
calculateParentsOfOXNode: anOXNode
  "look up parents for anOXNode object without running an additional analysis"

  | parentsInfo searchObject |
  searchObject := Object _objectForOop: anOXNode oop.
  parentsInfo := SystemRepository _refPathParentsOf: searchObject.
  System commit.
  self oopToNodeMap at: searchObject asOop put: anOXNode.
  self analyzeReferenceGsBitmap: parentsInfo parentOops node: anOXNode