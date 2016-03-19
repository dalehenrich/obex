obex data sources
obexAddDataSource: dataSource named: aStringOrNil
  | dataStore |
  dataStore := OXObjectDataStore new
    objects: dataSource;
    yourself.
  aStringOrNil ifNotNIl: [ dataStore dataStoreName: aStringOrNil ].
  ^ dataStore pushOnStack: #'objects' in: self obexDataStoreRoot