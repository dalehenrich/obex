analysis
listReferences: objectsArray limit: limit withMaxThreads: maxSessions maxCpuUsage: maxPercentCpu
  targetObjects := TransientValue value: objectsArray.
  maxThreads := maxSessions.
  maxCpuUsage := maxPercentCpu.
  self
    searchResult:
      (self
        rawListReferences: objectsArray
        limit: limit
        withMaxThreads: maxSessions
        maxCpuUsage: maxPercentCpu).
  self analyze