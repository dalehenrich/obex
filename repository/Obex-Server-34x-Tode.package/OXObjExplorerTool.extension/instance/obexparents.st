*obex-server-34x-tode
obexparents
  "
  obex parents [--exclude=<st-expression>]  --st=<st-expression> | oop... 
"

  | objects dataStore excludeArray |
  self
    getSubcommandOptsMixedLongShort:
      {#('st' nil #'required').
      #('exclude' nil #'required')}.
  excludeArray := subOptions
    at: 'exclude'
    ifPresent: [ :expression | expression evaluate ]
    ifAbsent: [ #() ].
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
    excludedArray: excludeArray;
    findRefPathsParentsOfObjects: objects;
    yourself.
  self obexDataStoreRoot parentsOf push: dataStore