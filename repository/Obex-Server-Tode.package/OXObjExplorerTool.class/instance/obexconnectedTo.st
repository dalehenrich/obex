obex data sources
obexconnectedTo
  "
  obex connectedTo [--name=<dataStore-name>] [--type=array|set|oopArray|oopSet|bitmap]
                 --dataSource=<dataStore-name> | --st=<st-expression> | oop...
"

  "browse method --spec `OXObjExplorerTool class>>obexconnectedToManPage`"

  | dataSource objects dataSourceClass |
  self
    getSubcommandOptsMixedLongShort:
      {#('name' nil #'required').
      #('st' nil #'required').
      #('dataSource' nil #'required').
      #('type' nil #'required')}.
  objects := subOptions
    at: 'st'
    ifPresent: [ :expression | expression evaluate ]
    ifAbsent: [ 
      objects := subOptions
        at: 'dataSource'
        ifPresent: [ :dataSourceName | (self obexDataStoreRoot dataStoreNamed: dataSourceName) objects asArray ]
        ifAbsent: [ 
          subArguments isEmpty
            ifTrue: [ self error: 'Missing required argument(s) oops. See man page for details.' ].
          (subArguments collect: [ :oop | Object _objectForOop: oop asNumber ])
            asArray ] ].
  subOptions
    at: 'type'
    ifAbsent: [ 
      "default type"
      subOptions at: 'type' put: 'bitmap' ].
  dataSourceClass := subOptions
    at: 'type'
    ifPresent: [ :type | 
      type = 'array'
        ifTrue: [ OXObjectArray ]
        ifFalse: [ 
          type = 'set'
            ifTrue: [ OXObjectIdentitySet ]
            ifFalse: [ 
              type = 'oopArray'
                ifTrue: [ OXOopArray ]
                ifFalse: [ 
                  type = 'oopSet'
                    ifTrue: [ OXOopIdentitySet ]
                    ifFalse: [ 
                      type = 'bitmap'
                        ifTrue: [ 
                          Smalltalk
                            at: #'GsBitmap'
                            ifAbsent: [ self error: 'The `bitmap` type only support in GemStone 3.4 and later' ].
                          OXBitmap ]
                        ifFalse: [ self error: 'Unknown type: ' , type printString , '. See man page for details' ] ] ] ] ] ].
  System commit.
  dataSource := dataSourceClass findObjectsConnectedTo: objects.
  ^ subOptions
    at: 'name'
    ifPresent: [ :dataStoreName | self obexAddDataSource: dataSource named: dataStoreName ]
    ifAbsent: [ self obexAddDataSource: dataSource ]