obex references
obexReferencesTo: objectsArray named: dataStoreNameOrNil
  ^ self
    obexReferencesTo: objectsArray
    withMaxSessions: self defaultMaxSessions
    maxCpuUsage: self defaultMaxPercentCpu
    named: dataStoreNameOrNil