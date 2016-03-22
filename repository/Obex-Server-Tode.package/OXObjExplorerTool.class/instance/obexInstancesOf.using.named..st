obex instances
obexInstancesOf: classesArray using: dataSourceClass named: dataStoreNameOrNil
  ^ self
    obexInstancesOf: classesArray
    withMaxSessions: self defaultMaxSessions
    maxCpuUsage: self defaultMaxPercentCpu
    using: dataSourceClass
    named: dataStoreNameOrNil