obex objects
obexobjects
  "
  obex objects [--name=<dataStore-name>] [--type=array|set|oopArray|oopSet|bitmap|asis]
               [--st=<st-expression> | oop...] 
"

  "browse method --spec `OXObjExplorerTool class>>obexobjectsManPage`"

  | dataSourceClass objects dataStoreNameOrNil |
  self
    getSubcommandOptsMixedLongShort:
      {#('name' nil #'required').
      #('st' nil #'required').
      #('type' nil #'required')}.
  objects := self
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
                            ifAbsent: [ self error: 'The `bitmap` type only supported in GemStone 3.4 and later' ].
                          OXBitmap ]
                        ifFalse: [ 
                          type = 'asis'
                            ifTrue: [ nil ]
                            ifFalse: [ self error: 'Unknown type: ' , type printString , '. See man page for details' ] ] ] ] ] ] ].
  dataStoreNameOrNil := subOptions
    at: 'name'
    ifPresent: [ :dataStoreName | dataStoreName ]
    ifAbsent: [  ].
  ^ self obexObjects: objects for: dataSourceClass named: dataStoreNameOrNil