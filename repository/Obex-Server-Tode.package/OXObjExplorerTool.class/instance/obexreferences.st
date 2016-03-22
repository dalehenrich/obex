obex references
obexreferences
  "
  obex references [--name=<dataStore-name>] [--memory] [--classes] [--st=<st-expression> | oop-or-classname...]
"

  "browse method --spec `OXObjExplorerTool class>>obexreferencesManPage`"

  self
    getSubcommandOptsMixedLongShort:
      {#('name' nil #'required').
      #('st' nil #'required').
      #('memory' nil #'none').
      #('classes' nil #'none')}.
  subOptions
    at: 'classes'
    ifPresent: [  ]
    ifAbsent: [ 
      | objectsArray dataStoreNameOrNil |
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
            ifFalse: [ 
              subArguments
                collect: [ :className | 
                  self halt.
                  Smalltalk at: className ] ])
            asArray ].
      dataStoreNameOrNil := subOptions
        at: 'name'
        ifPresent: [ :dataStoreName | dataStoreName ]
        ifAbsent: [  ].
      ^ self obexReferencesTo: objectsArray named: dataStoreNameOrNil ]