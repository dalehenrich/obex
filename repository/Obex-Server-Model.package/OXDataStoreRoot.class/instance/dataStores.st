accessing
dataStores
  dataStores ifNil: [ dataStores := StringKeyValueDictionary new ].
  ^ dataStores