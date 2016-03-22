obex objects
obexObjects: objects for: dataSourceClassOrNil named: dataStoreNameOrNil
  | dataSourceClass dataSource |
  dataSourceClass := dataSourceClassOrNil
    ifNil: [ self defaultDataSourceClass ]
    ifNotNil: [ dataSourceClassOrNil ].
  dataSource := dataSourceClass from: objects.
  ^ self obexAddDataSource: dataSource named: dataStoreNameOrNil