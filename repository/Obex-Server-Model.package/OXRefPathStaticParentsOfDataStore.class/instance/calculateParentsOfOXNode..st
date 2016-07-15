node callbacks
calculateParentsOfOXNode: anOXNode
  "look up parents for anOXNode object without running an additional analysis"

  | parentsInfo searchObject |
  searchObject := anOXNode object.
  parentsInfo := SystemRepository _refPathParentsOf: searchObject.
  System commit.
  self oopToNodeMap at: searchObject asOop put: anOXNode.
  self analyzeReferenceParentsInfo: parentsInfo node: anOXNode