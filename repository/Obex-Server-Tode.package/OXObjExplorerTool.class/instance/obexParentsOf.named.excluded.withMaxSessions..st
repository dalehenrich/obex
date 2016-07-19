obex parentsOf
obexParentsOf: objectsArray named: dataStoreNameOrNil excluded: excluded withMaxSessions: maxSessions
  ^ self
    obexParentsOf: objectsArray
    withMaxSessions: maxSessions
    maxCpuUsage: self defaultMaxPercentCpu
    named: dataStoreNameOrNil
    excluded: excluded