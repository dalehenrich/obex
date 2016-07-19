obex parentsOf
obexParentsOf: objectsArray named: dataStoreNameOrNil excluded: excluded
  ^ self
    obexParentsOf: objectsArray
    named: dataStoreNameOrNil
    excluded: excluded
    withMaxSessions: self defaultMaxSessions