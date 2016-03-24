obex references
obexReferencesTo: objectsArray withMaxSessions: maxSessions maxCpuUsage: maxPercentCpu named: dataStoreNameOrNil
  ^ self
    obexReferencesTo: objectsArray
    withMaxSessions: maxSessions
    maxCpuUsage: maxPercentCpu
    named: dataStoreNameOrNil
    excluded: #()