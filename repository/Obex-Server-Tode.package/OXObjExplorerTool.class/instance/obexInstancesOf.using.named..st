obex instances
obexInstancesOf: classesArray using: dataSourceClass named: dataStoreNameOrNil
  ^ self
    obexInstancesOf: classesArray
    using: dataSourceClass
    named: dataStoreNameOrNil
    withMaxSessions: self defaultMaxSessions