obex
obexDataStore
  | dataStoreName |
  dataStoreName := self options
    at: 'dataStore'
    ifPresent: [ :arg | arg asSymbol ]
    ifAbsent: [ #'OX_DATA_STORE' ].
  ^ UserGlobals at: dataStoreName ifAbsentPut: OXDataStore new