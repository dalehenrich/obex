running
setUpBug46116
  "self reset"

  | class |
  class := Object
    subclass: 'ObexTestBug46116'
    instVarNames: #()
    classVars: #(#'classVar')
    classInstVars: #()
    poolDictionaries: #()
    inDictionary: ''
    category: 'Bug46116'
    options: #().
  class class
    compileMethod: 'test classvar := self new'
    dictionaries: GsCurrentSession currentSession symbolList
    category: 'bug'.
  class perform: #'test'.
  System commit.
  class removeFromSystem.
  System commit