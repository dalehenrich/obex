obex
obexRootDataStoreName
  ^ self options
    at: 'dataStore'
    ifPresent: [ :arg | arg asSymbol ]
    ifAbsent: [ #'OX_DATA_STORE' ]