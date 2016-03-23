obex references
obexReferencesTo: objectsArray withMaxSessions: maxSessions maxCpuUsage: maxPercentCpu named: dataStoreNameOrNil
  | dataStore results |
  dataStore := OXReferencesToDataStore new
    listReferences: objectsArray
      limit: 0
      withMaxThreads: maxSessions
      maxCpuUsage: maxPercentCpu;
    dataStoreName: dataStoreNameOrNil;
    yourself.
  ^ dataStore pushOnStack: #'references' in: self obexDataStoreRoot