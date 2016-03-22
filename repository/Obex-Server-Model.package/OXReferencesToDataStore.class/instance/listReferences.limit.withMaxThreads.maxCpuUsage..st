analysis
listReferences: objectsArray limit: limit withMaxThreads: maxSessions maxCpuUsage: maxPercentCpu
  targetObjects := TransientValue value: objectsArray.
  maxThreads := maxSessions.
  maxCpuUsage := maxPercentCpu.
  self
    searchResult:
      (SystemRepository
        listReferences: objectsArray
        withLimit: limit
        withMaxThreads: maxThreads
        maxCpuUsage: maxCpuUsage).
  self analyze