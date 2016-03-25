obex connectedTo
obexconnectedTo
  "
  obex connectedTo [--name=<dataStore-name>] [--type=array|set|oopArray|oopSet|bitmap]
                   [--st=<st-expression> | oop...]
"

  "browse method --spec `OXObjExplorerTool class>>obexconnectedToManPage`"

  | dataStoreNameOrNil objectsArray dataSourceClass |
  self
    getSubcommandOptsMixedLongShort:
      {#('name' nil #'required').
      #('st' nil #'required').
      #('type' nil #'required')}.
  objectsArray := self self
    handleObjectsArrayOptionsSubArgsCollect: [ :oop | Object _objectForOop: oop asNumber ].
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
                        ifFalse: [ self error: 'Unknown type: ' , type printString , '. See man page for details' ] ] ] ] ] ]
    ifAbsent: [ self defaultDataSourceClass ].
  dataStoreNameOrNil := subOptions
    at: 'name'
    ifPresent: [ :dataStoreName | dataStoreName ]
    ifAbsent: [  ].
  ^ self
    obexFindObjectsConnectedTo: objectsArray
    using: dataSourceClass
    named: dataStoreNameOrNil