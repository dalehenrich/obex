data sources
obexAddDataSource: dataSource named: aStringOrNil
  | dataStore |
  dataSource isObexDataSource
    ifTrue: [ 
      "asis --type, allows anything to be cached as a dataSource"
      dataSource persist ].
  dataStore := OXObjectDataStore new
    objects: dataSource;
    yourself.
  aStringOrNil ifNotNil: [ dataStore dataStoreName: aStringOrNil ].
  ^ dataStore pushOnStack: #'objects' in: self obexDataStoreRoot