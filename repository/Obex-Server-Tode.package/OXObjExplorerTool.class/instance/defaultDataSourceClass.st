defaults
defaultDataSourceClass
  ^ (Smalltalk at: #'GsBitmap') ifNotNil: [ OXBitmap ] ifNil: [ OXOopArray ]