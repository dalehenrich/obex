obex references
obexReferencesTo: objectsArray
  ^ self
    obexReferencesTo: objectsArray
    withMaxSessions: self defalutMaxSessions
    maxCpuUsage: self defaultMaxPercentCpu
    named: nil