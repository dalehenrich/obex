analysis
listReferences: objectsArray limit: limit withMaxThreads: maxSessions maxCpuUsage: maxPercentCpu
  self rawTargetObjects value: objectsArray.
  maxThreads := maxSessions.
  maxCpuUsage := maxPercentCpu.
  self
    searchResult:
      (self
        rawListReferences: objectsArray
        limit: limit
        withMaxThreads: maxSessions
        maxCpuUsage: maxPercentCpu).
  self analyze.
  objectsArray
    do: [ :each | 
      | node |
      "searchNodeMap keys used to prime view with initial objects"
      node := self oopToNodeMap at: each asOop.
      searchNodeMap at: node put: #() ]