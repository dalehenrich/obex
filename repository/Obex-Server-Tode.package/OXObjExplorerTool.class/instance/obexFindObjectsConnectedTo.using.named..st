obex connectedTo
obexFindObjectsConnectedTo: objectsArray using: dataSourceClass named: dataStoreNameOrNil
  | dataSource |
  System commit.
  dataSource := dataSourceClass findObjectsConnectedTo: objectsArray.
  ^ self obexAddDataSource: dataSource named: dataStoreNameOrNil