actions
pushOnStack: aSymbol in: aDataStoreRoot
  self dataStoreName
    ifNotNil: [ :aString | aDataStoreRoot namedDataStores at: aString put: self ].
  (aDataStoreRoot perform: aSymbol) push: self