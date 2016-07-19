obex parentsOf
obexStaticParentsOf: objectsArray named: dataStoreNameOrNil excluded: excluded
  ^ self
    obexStaticParentsOf: objectsArray
    named: dataStoreNameOrNil
    excluded: excluded
    withMaxSessions: self defaultMaxSessions