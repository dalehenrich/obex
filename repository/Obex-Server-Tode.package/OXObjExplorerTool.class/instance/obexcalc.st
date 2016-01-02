obex
obexcalc
  "
  obex calc [--maxPaths=<max-paths>] --st=<st-expression> | oop... 
"

  | objects maxPaths dataStore result |
  self
    getSubcommandOptsMixedLongShort:
      {#('globalName' nil #'required').
      #('st' nil #'required').
      #('maxPaths' nil #'required')}.
  subOptions
    at: 'maxPaths'
    ifPresent: [ :arg | maxPaths := arg asNumber ]
    ifAbsent: [ maxPaths := 32 ].
  objects := subOptions
    at: 'st'
    ifPresent: [ :expression | expression evaluate ]
    ifAbsent: [ 
      subArguments isEmpty
        ifTrue: [ self error: 'Missing required argument(s) <oop. See man page for details.' ].
      (subArguments collect: [ :oop | Object _objectForOop: oop asNumber ])
        asArray ].
  System commitTransaction.
  result := OXReferencePathDataStore new
    findAllReferencePathsToObjects: objects
    maxPaths: maxPaths.
  self obexDataStore referencePaths push: result