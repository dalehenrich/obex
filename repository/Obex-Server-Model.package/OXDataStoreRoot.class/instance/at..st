accessing
at: dataStoreName
  ^ self dataStores at: dataStoreName ifAbsentPut: [ Stack new ]