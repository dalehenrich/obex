obex connectedTo
obexFindObjectsConnectedTo: objectsArray
  ^ self
    obexFindObjectsConnectedTo: objectsArray
    using: self defaultDataSourceClass
    named: nil