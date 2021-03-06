analysis
findRefPathsParentsOfObjects: objects withMaxThreads: maxSessions maxCpuUsage: maxPercentCpu
  | result |
  maxThreads := maxSessions.
  maxCpuUsage := maxPercentCpu.
  result := self
    rawFindRefPathsParentsOfObjects: objects
    withMaxThreads: maxSessions
    maxCpuUsage: maxPercentCpu.
  self searchResult: result.
  self analyze.
  objects
    do: [ :each | 
      | node |
      "searchNodeMap keys used to prime view with initial objects"
      node := self oopToNodeMap at: each asOop.
      searchNodeMap at: node put: #() ]