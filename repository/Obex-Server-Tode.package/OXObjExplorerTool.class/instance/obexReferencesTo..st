obex references
obexReferencesTo: objectsArray
  ^ self
    obexReferencesTo: objectsArray
    withMaxSessions: self defaultMaxSessions
    maxCpuUsage: self defaultMaxPercentCpu
    named: nil