obex references
obexreferences
  "
  obex references [--name=<dataStore-name>] [--memory] [--classes] [--exclude=<st-expression>]
                  [--st=<st-expression> | oop-or-classname...]
"

  "browse method --spec `OXObjExplorerTool class>>obexreferencesManPage`"

  | excluded |
  self
    getSubcommandOptsMixedLongShort:
      {#('name' nil #'required').
      #('st' nil #'required').
      #('exclude' nil #'required').
      #('memory' nil #'none').
      #('classes' nil #'none')}.
  excluded := subOptions
    at: 'exclude'
    ifPresent: [ :expression | expression evaluate ]
    ifAbsent: [ #() ].
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
                collect: [ :classNameOrOop | 
                  self halt.
                  Smalltalk at: classNameOrOop ] ])
            asArray ].
      dataStoreNameOrNil := subOptions
        at: 'name'
        ifPresent: [ :dataStoreName | dataStoreName ]
        ifAbsent: [  ].
      ^ self
        obexReferencesTo: objectsArray
        named: dataStoreNameOrNil
        excluded: excluded ]