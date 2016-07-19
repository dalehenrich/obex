obex parentsOf
obexStaticParentsOf: objectsArray named: dataStoreNameOrNil excluded: excluded withMaxSessions: maxSessions
  ^ self
    obexStaticParentsOf: objectsArray
    withMaxSessions: maxSessions
    maxCpuUsage: self defaultMaxPercentCpu
    named: dataStoreNameOrNil
    excluded: excluded