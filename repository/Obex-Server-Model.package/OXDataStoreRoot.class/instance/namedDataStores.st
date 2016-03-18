accessing
namedDataStores
  namedDataStores ifNil: [ namedDataStores := StringKeyValueDictionary new ].
  ^ namedDataStores