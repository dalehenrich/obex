obex instances
obexInstancesOf: classesArray withMaxSessions: maxSessions maxCpuUsage: maxPercentCpu using: dataSourceClass named: dataStoreNameOrNil
  | dataSource |
  System commit.
  dataSource := dataSourceClass
    listInstances: classesArray
    withMaxSessions: maxSessions
    maxCpuUsage: maxPercentCpu.
  ^ self obexAddDataSource: dataSource named: dataStoreNameOrNil