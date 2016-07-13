obex parentsOf
obexStaticParentsOf: objectsArray named: dataStoreNameOrNil excluded: excluded
  ^ self
    obexStaticParentsOf: objectsArray
    withMaxSessions: self defaultMaxSessions
    maxCpuUsage: self defaultMaxPercentCpu
    named: dataStoreNameOrNil
    excluded: excluded