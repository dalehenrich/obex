obex parentsOf
obexStaticParentsOf: objectsArray withMaxSessions: maxSessions maxCpuUsage: maxPercentCpu named: dataStoreNameOrNil excluded: excluded
  | dataStore results |
  dataStore := OXRefPathStaticParentsOfDataStore new
    excludedArray: excluded;
    findRefPathsParentsOfObjects: objectsArray
      withMaxThreads: maxSessions
      maxCpuUsage: maxPercentCpu;
    dataStoreName: dataStoreNameOrNil;
    yourself.
  ^ dataStore pushOnStack: #'parentsOf' in: self obexDataStoreRoot