obex spectro
obexSpectroRepo: classArray srcDataStore: srcDataStore maxSession: maxSessions percentCpu: percentCpu
  | classOopToDataPointMap resultInstances |
  System commit.
  SystemRepository
    listInstancesToHiddenSet: classArray
    withMaxThreads: maxSessions
    maxCpuUsage: percentCpu.
  resultInstances := System hiddenSetAsArray: 1.
  self obexSpectroInstances: resultInstances srcDataStore: srcDataStore