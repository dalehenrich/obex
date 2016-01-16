*obex-server-34x-tode
obexSpectroRepo: classArray srcDataStore: srcDataStore maxSession: maxSessions persentCpu: percentCpu
  | classOopToDataPointMap resultInstances |
  System commit.
  SystemRepository
    listInstancesToHiddenSet: classArray
    withMaxThreads: maxSessions
    maxCpuUsage: percentCpu.
  resultInstances := System hiddenSetAsArray: 1.
  self obexSpectroInstances: resultInstances srcDataStore: srcDataStore