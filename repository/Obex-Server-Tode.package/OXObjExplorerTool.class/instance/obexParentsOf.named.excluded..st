obex parentsOf
obexParentsOf: objectsArray named: dataStoreNameOrNil excluded: excluded
  ^ self
    obexParentsOf: objectsArray
    withMaxSessions: self defaultMaxSessions
    maxCpuUsage: self defaultMaxPercentCpu
    named: dataStoreNameOrNil
    excluded: excluded