obex
obexGlobalName
  ^ self subOptions
    at: 'globalName'
    ifPresent: [ :arg | arg asSymbol ]
    ifAbsent: [ #'TODE_PPT_REFEREMCE_PATHS' ]