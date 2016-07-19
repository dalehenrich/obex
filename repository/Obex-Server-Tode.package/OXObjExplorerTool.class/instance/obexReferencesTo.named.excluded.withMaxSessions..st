obex references
obexReferencesTo: objectsArray named: dataStoreNameOrNil excluded: excluded withMaxSessions: maxSessions
  ^ self
    obexReferencesTo: objectsArray
    withMaxSessions: maxSessions
    maxCpuUsage: self defaultMaxPercentCpu
    named: dataStoreNameOrNil
    excluded: excluded