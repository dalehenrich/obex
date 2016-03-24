obex references
obexInMemoryReferencesTo: objectsArray named: dataStoreNameOrNil excluded: excluded
  | dataStore results |
  dataStore := OXReferencesToDataStore new
    excludedArray: excluded;
    listInMemoryReferences: objectsArray;
    dataStoreName: dataStoreNameOrNil;
    yourself.
  ^ dataStore pushOnStack: #'references' in: self obexDataStoreRoot