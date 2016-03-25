obex references
obexreferences
  "
  obex references [--name=<dataStore-name>] [--memory] [--exclude=<st-expression>]
                  [--st=<st-expression> | oop...]
"

  "browse method --spec `OXObjExplorerTool class>>obexreferencesManPage`"

  | excluded objectsArray dataStoreNameOrNil |
  self
    getSubcommandOptsMixedLongShort:
      {#('name' nil #'required').
      #('st' nil #'required').
      #('exclude' nil #'required').
      #('memory' nil #'none')}.
  excluded := subOptions
    at: 'exclude'
    ifPresent: [ :expression | expression evaluate ]
    ifAbsent: [ {} ].
  objectsArray := subOptions
    at: 'st'
    ifPresent: [ :expression | expression evaluate asArray ]
    ifAbsent: [ 
      (subArguments isEmpty
        ifTrue: [ 
          objIn isObexDataStore
            ifTrue: [ objIn objects ]
            ifFalse: [ 
              objIn isCollection
                ifFalse: [ self error: 'objIn is not a collection. See man page for details.' ].
              objIn ] ]
        ifFalse: [ subArguments collect: [ :oop | Object _objectForOop: oop ] ])
        asArray ].
  dataStoreNameOrNil := subOptions
    at: 'name'
    ifPresent: [ :dataStoreName | dataStoreName ]
    ifAbsent: [  ].
  ^ subOptions
    at: 'memory'
    ifPresent: [ :ignored | 
      self
        obexInMemoryReferencesTo: objectsArray
        named: dataStoreNameOrNil
        excluded: excluded ]
    ifAbsent: [ self obexReferencesTo: objectsArray named: dataStoreNameOrNil excluded: excluded ]