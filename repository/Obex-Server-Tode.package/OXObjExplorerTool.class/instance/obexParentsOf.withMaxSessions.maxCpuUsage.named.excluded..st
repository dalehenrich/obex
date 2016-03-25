obex parentsOf
obexParentsOf: objectsArray withMaxSessions: maxSessions maxCpuUsage: maxPercentCpu named: dataStoreNameOrNil excluded: excluded
  | dataStore results |
  dataStore := OXRefPathParentsOfDataStore new
    excludedArray: excluded;
    findRefPathsParentsOfObjects: objectsArray
      withMaxThreads: maxSessions
      maxCpuUsage: maxPercentCpu;
    dataStoreName: dataStoreNameOrNil;
    yourself.
  ^ dataStore pushOnStack: #'parentsOf' in: self obexDataStoreRoot