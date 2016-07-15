node callbacks
calculateParentsOfOXNode: anOXNode
  | ds objects searchObject results |
  System commit.
  searchObject := anOXNode object.
  objects := {searchObject}.
  results := self
    rawFindRefPathsParentsOfObjects: objects
    withMaxThreads: maxThreads
    maxCpuUsage: maxCpuUsage.
  self oopToNodeMap at: searchObject asOop put: anOXNode.
  results
    do: [ :parentsInfo | self analyzeReferenceParentsInfo: parentsInfo node: anOXNode ]