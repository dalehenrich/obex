obex instances
obexinstances
  "
  obex instances [--name=<dataStore-name>] [--type=array|set|oopArray|oopSet|bitmap]
                 [--st=<st-expression> | className...]
"

  "browse method --spec `OXObjExplorerTool class>>obexinstancesManPage`"

  | classesArray dataSourceClass dataStoreNameOrNil |
  self
    getSubcommandOptsMixedLongShort:
      {#('name' nil #'required').
      #('st' nil #'required').
      #('type' nil #'required')}.
  classesArray := self
    handleObjectsArrayOptionsSubArgsCollect: [ :className | Smalltalk at: className ].
  classesArray := classesArray reject: [ :class | class isBehavior not ].
  classesArray isEmpty
    ifTrue: [ self error: 'No classes in list. See man page for details.' ].
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
    obexInstancesOf: classesArray
    using: dataSourceClass
    named: dataStoreNameOrNil