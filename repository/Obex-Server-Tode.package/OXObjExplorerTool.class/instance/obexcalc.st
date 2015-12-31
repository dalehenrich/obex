obex
obexcalc
  "
  obex calc [--maxPaths=<max-paths>] --st=<st-expression> | oop... 
"

  | objects maxPaths dataStore |
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
    ifAbsent: [ (subArguments collect: [ :oop | Object _objectForOop: oop asNumber ]) asArray ].
  dataStore := self obexDataStore.
  dataStore findAllReferencePathsToObjects: objects maxPaths: maxPaths