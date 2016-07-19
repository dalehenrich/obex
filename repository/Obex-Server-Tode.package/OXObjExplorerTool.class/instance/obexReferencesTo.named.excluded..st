obex references
obexReferencesTo: objectsArray named: dataStoreNameOrNil excluded: excluded
  ^ self
    obexReferencesTo: objectsArray
    named: dataStoreNameOrNil
    excluded: excluded
    withMaxSessions: self defaultMaxSessions