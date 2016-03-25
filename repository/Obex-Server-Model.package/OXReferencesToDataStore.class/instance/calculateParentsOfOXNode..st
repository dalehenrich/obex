node callbacks
calculateParentsOfOXNode: anOXNode
  | results |
  System commit.
  self inMemory
    ifTrue: [ 
      | objectArray |
      objectArray := {(Object _objectForOop: anOXNode oop)}.
      results := self rawListInMemoryReferences: objectArray.
      self excludedArray
        add: objectArray;
        add: (results at: 1) ]
    ifFalse: [ 
      | objectArray searchObject |
      searchObject := Object _objectForOop: anOXNode oop.
      objectArray := {searchObject}.
      results := self
        rawListReferences: objectArray
        limit: 0
        withMaxThreads: maxThreads
        maxCpuUsage: maxCpuUsage ].
  self oopToNodeMap at: anOXNode oop ifAbsentPut: anOXNode.
  (results at: 1) do: [ :obj | self analyzeReference: obj node: anOXNode ]