analysis
listReferences: objectsArray
  ^ self
    listReferences: objectsArray
    limit: 0
    withMaxThreads: 1
    maxCpuUsage: 90