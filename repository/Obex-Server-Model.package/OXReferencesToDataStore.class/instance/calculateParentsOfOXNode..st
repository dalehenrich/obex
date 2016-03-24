node callbacks
calculateParentsOfOXNode: anOXNode
  | objectArray searchObject results |
  System commit.
  searchObject := Object _objectForOop: anOXNode oop.
  objectArray := {searchObject}.
  results := self inMemory
    ifTrue: [ self rawListInMemoryReferences: objectArray ]
    ifFalse: [ 
      self
        rawListReferences: objectArray
        limit: 0
        withMaxThreads: maxThreads
        maxCpuUsage: maxCpuUsage ].
  self oopToNodeMap at: searchObject asOop ifAbsentPut: anOXNode.
  (results at: 1) do: [ :obj | self analyzeReference: obj node: anOXNode ]