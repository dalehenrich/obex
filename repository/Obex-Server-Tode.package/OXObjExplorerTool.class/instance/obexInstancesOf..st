obex instances
obexInstancesOf: classesArray
  ^ self
    obexInstancesOf: classesArray
    using: self defaultDataSourceClass
    named: nil