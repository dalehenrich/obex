*obex-server-34x-tode
obexparents
  "
  obex parents --st=<st-expression> | oop... 
"

  | objects dataStore |
  self getSubcommandOptsMixedLongShort: {#('st' nil #'required')}.
  objects := subOptions
    at: 'st'
    ifPresent: [ :expression | expression evaluate ]
    ifAbsent: [ 
      subArguments isEmpty
        ifTrue: [ self error: 'Missing required argument(s) <oop. See man page for details.' ].
      (subArguments collect: [ :oop | Object _objectForOop: oop asNumber ])
        asArray ].
  System commit.
  dataStore := OXRefPathParentsOfDataStore new
    findRefPathsParentsOfObjects: objects.
  self obexDataStoreRoot parentsOf push: dataStore