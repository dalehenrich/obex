node callbacks
calculateParentsOfOXBehaviorReferenceNode: anOXNode
  | ds objectArray searchObject |
  System commit.
  searchObject := Object _objectForOop: anOXNode oop.
  objectArray := {searchObject}.
  ds := self class new
    listReferences: objectArray
      limit: 0
      withMaxThreads: self maxThreads
      maxCpuUsage: self maxCpuUsage;
    yourself.
  self oopToNodeMap at: searchObject asOop put: anOXNode.
  (ds searchObjectMap at: searchObject)
    do: [ :ar | self analyzeReferenceArray: ar node: anOXNode nodeRef: {} ]