defaults
defaultDataSourceClass
  ^ Smalltalk
    at: #'GsBitmap'
    ifPresent: [ :cls | OXBitmap ]
    ifAbsent: [ OXOopArray ]