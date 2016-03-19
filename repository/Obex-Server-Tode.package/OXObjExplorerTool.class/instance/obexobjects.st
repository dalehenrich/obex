obex data sources
obexobjects
  "
  obex objects [--name=<dataStore-name>] [--type=array|set|oopArray|oopSet|bitmap|asis] --st=<st-expression> | oop... 
"

  "browse method --spec `OXObjExplorerTool class>>obexobjectsManPage`"

  | objects collection |
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
        ifTrue: [ self error: 'Missing required argument(s) oops. See man page for details.' ].
      (subArguments collect: [ :oop | Object _objectForOop: oop asNumber ])
        asArray ].
  collection := subOptions
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
                        ifTrue: [ OXBitmap from: objects ]
                        ifFalse: [ 
                          type = 'asis'
                            ifTrue: [ objects ]
                            ifFalse: [ self error: 'Unknown type: ' , type printString ] ] ] ] ] ] ]