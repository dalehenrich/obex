repository analysis
listInstances: anArrayOfClasses withMaxSessions: maxSessions maxCpuUsage: aPercentage
  "list instances of the given classes and return results in an instance of the receiver"

  | bm |
  bm := GsBitmap newForHiddenSet: #'ListInstances'.
  SystemRepository
    listInstancesToHiddenSet: anArrayOfClasses
    withMaxThreads: maxSessions
    maxCpuUsage: aPercentage.
  ^ self new
    _collection: bm;
    yourself