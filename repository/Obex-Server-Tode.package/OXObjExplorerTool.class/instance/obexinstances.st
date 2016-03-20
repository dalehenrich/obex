obex data sources
obexinstances
  "
  obex instances [--name=<dataStore-name>] [--type=array|set|oopArray|oopSet|bitmap]
                 [--st=<st-expression> | className...]
"

  "browse method --spec `OXObjExplorerTool class>>obexinstancesManPage`"

  | dataSourceClass classesArray dataSource |
  self
    getSubcommandOptsMixedLongShort:
      {#('name' nil #'required').
      #('st' nil #'required').
      #('type' nil #'required')}.
  classesArray := subOptions
    at: 'st'
    ifPresent: [ :expression | expression evaluate asArray ]
    ifAbsent: [ 
      (subArguments isEmpty
        ifTrue: [ 
          objIn isCollection
            ifFalse: [ self error: 'objIn is not a collection. See man page for details.' ].
          objIn ]
        ifFalse: [ subArguments collect: [ :className | Smalltalk at: className ] ])
        asArray ].
  classesArray := classesArray reject: [ :class | class isBehavior not ].
  classesArray isEmpty
    ifTrue: [ self error: 'No classes in list. See man page for details.' ].
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
  dataSource := dataSourceClass
    listInstances: classesArray
    withMaxSessions: self defaultMaxSessions
    maxCpuUsage: self defaultMaxPercentCpu.
  ^ subOptions
    at: 'name'
    ifPresent: [ :dataStoreName | self obexAddDataSource: dataSource named: dataStoreName ]
    ifAbsent: [ self obexAddDataSource: dataSource ]