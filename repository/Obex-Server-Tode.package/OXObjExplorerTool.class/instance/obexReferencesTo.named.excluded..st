obex references
obexReferencesTo: objectsArray named: dataStoreNameOrNil excluded: excluded
  ^ self
    obexReferencesTo: objectsArray
    withMaxSessions: self defaultMaxSessions
    maxCpuUsage: self defaultMaxPercentCpu
    named: dataStoreNameOrNil
    excluded: excluded