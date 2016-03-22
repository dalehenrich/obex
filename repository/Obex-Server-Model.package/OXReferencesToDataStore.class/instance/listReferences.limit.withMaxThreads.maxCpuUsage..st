analysis
listReferences: objectsArray limit: limit withMaxThreads: maxSessions maxCpuUsage: maxPercentCpu
  targetObjects := TransientValue value: objectsArray.
  self
    searchResult:
      (SystemRepository
        listReferences: objectsArray
        withLimit: limit
        withMaxThreads: maxSessions
        maxCpuUsage: maxPercentCpu).
  self analyze