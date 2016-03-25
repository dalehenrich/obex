argument handling
handleObjectsArrayOptionsSubArgsCollect: subArgumentsCollectBlock
  ^ (subOptions
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
        ifFalse: [ subArguments collect: subArgumentsCollectBlock ] ])
    asArray