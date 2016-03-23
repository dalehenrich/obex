analysis
rawListReferences: objectsArray limit: limit withMaxThreads: maxSessions maxCpuUsage: maxPercentCpu
  System commit.
  ^ SystemRepository
    listReferences: objectsArray
    withLimit: limit
    withMaxThreads: maxThreads
    maxCpuUsage: maxCpuUsage