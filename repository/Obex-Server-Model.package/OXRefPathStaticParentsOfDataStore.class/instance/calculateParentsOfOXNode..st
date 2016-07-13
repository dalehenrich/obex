node callbacks
calculateParentsOfOXNode: anOXNode
  "look up parents for anOXNode object without running an additional analysis"

  | parentInfo |
  parentInfo := SystemRepository
    _refPathParentsOf: (Object _objectForOop: anOXNode oop).
  self analyzeReferenceGsBitmap: parentInfo parentOops node: anOXNode