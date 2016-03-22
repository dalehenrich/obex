obex connectedTo
obexFindObjectsConnectedTo: objectsArray using: dataSourceClass
  ^ self
    obexFindObjectsConnectedTo: objectsArray
    using: dataSourceClass
    named: nil