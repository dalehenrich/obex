obex data sources
obexobjects
  "
  obex objects [--name=<dataStore-name>] [--type=array|set|oopArray|oopSet|bitmap|asis]
               [--st=<st-expression> | oop...] 
"

  "browse method --spec `OXObjExplorerTool class>>obexobjectsManPage`"

  | dataSource objects |
  self
    getSubcommandOptsMixedLongShort:
      {#('name' nil #'required').
      #('st' nil #'required').
      #('type' nil #'required')}.
  objects := subOptions
    at: 'st'
    ifPresent: [ :expression | expression evaluate ]
    ifAbsent: [ 
      subArguments isEmpty
        ifTrue: [ 
          objIn isObexDataStore
            ifTrue: [ objIn objects ]
            ifFalse: [ 
              objIn isCollection
                ifFalse: [ self error: 'objIn is not a collection. See man page for details.' ].
              objIn ] ]
        ifFalse: [ (subArguments collect: [ :oop | Object _objectForOop: oop asNumber ]) asArray ] ].
  dataSource := subOptions
    at: 'type'
    ifPresent: [ :type | 
      type = 'array'
        ifTrue: [ OXObjectArray from: objects ]
        ifFalse: [ 
          type = 'set'
            ifTrue: [ OXObjectIdentitySet from: objects ]
            ifFalse: [ 
              type = 'oopArray'
                ifTrue: [ OXOopArray from: objects ]
                ifFalse: [ 
                  type = 'oopSet'
                    ifTrue: [ OXOopIdentitySet from: objects ]
                    ifFalse: [ 
                      type = 'bitmap'
                        ifTrue: [ 
                          Smalltalk
                            at: #'GsBitmap'
                            ifAbsent: [ self error: 'The `bitmap` type only support in GemStone 3.4 and later' ].
                          OXBitmap from: objects ]
                        ifFalse: [ 
                          type = 'asis'
                            ifTrue: [ objects ]
                            ifFalse: [ self error: 'Unknown type: ' , type printString , '. See man page for details' ] ] ] ] ] ] ]
    ifAbsent: [ self defaultDataSourceClass from: objects ].
  ^ subOptions
    at: 'name'
    ifPresent: [ :dataStoreName | self obexAddDataSource: dataSource named: dataStoreName ]
    ifAbsent: [ self obexAddDataSource: dataSource ]