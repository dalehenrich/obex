accessing
dataStoreStackAt: dataStoreStackName
  ^ self dataStores at: dataStoreStackName ifAbsentPut: [ Stack new ]