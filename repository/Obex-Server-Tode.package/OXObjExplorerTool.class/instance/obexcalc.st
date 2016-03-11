obex findAllRefs
obexcalc
  "
  obex calc [--maxPaths=<max-paths>] --st=<st-expression> | oop... 
"

  | objects maxPaths dataStore limitArray |
  self
    getSubcommandOptsMixedLongShort:
      {#('st' nil #'required').
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
  System commit.
  limitArray := true
    ifTrue: [ self obexMinLimitSetForRefPathScan ]
    ifFalse: [ SystemRepository buildLimitSetForRefPathScan ].
  objects do: [ :each | limitArray remove: each ifAbsent: [  ] ].
  self
    obexFindAllReferencePathsToObjects: objects
    limitObjArray: limitArray
    maxPaths: maxPaths