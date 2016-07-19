obex instances
obexInstancesOf: classesArray using: dataSourceClass named: dataStoreNameOrNil withMaxSessions: maxSessions
  ^ self
    obexInstancesOf: classesArray
    withMaxSessions: maxSessions
    maxCpuUsage: self defaultMaxPercentCpu
    using: dataSourceClass
    named: dataStoreNameOrNil