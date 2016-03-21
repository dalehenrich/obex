obex data sources
obexAddDataSource: dataSource named: aStringOrNil
  | dataStore |
  dataSource persist.
  dataStore := OXObjectDataStore new
    objects: dataSource;
    yourself.
  aStringOrNil ifNotNil: [ dataStore dataStoreName: aStringOrNil ].
  ^ dataStore pushOnStack: #'objects' in: self obexDataStoreRoot