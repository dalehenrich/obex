obex
obexcalc
  "
  obex calc [--maxPaths=<max-paths>] [--globalName=<cache-name>] \
           [ --st=<st-expression> | oop... ]
"

  | objects maxPaths searchResult obexRefPath globalName |
  self
    getSubcommandOptsMixedLongShort:
      {#('globalName' nil #'required').
      #('st' nil #'required').
      #('maxPaths' nil #'required')}.
  globalName := self obexGlobalName.
  subOptions
    at: 'maxPaths'
    ifPresent: [ :arg | maxPaths := arg asNumber ]
    ifAbsent: [ maxPaths := 32 ].
  objects := subOptions
    at: 'st'
    ifPresent: [ :expression | expression evaluate ]
    ifAbsent: [ (subArguments collect: [ :oop | Object _objectForOop: oop asNumber ]) asArray ].
  System abort.
  searchResult := SystemRepository
    findAllReferencePathsToObjects: objects
    maxPaths: maxPaths.
  obexRefPath := OXObjectExplorer searchResult: searchResult.
  UserGlobals at: globalName put: obexRefPath.
  System commit.
  obexRefPath analyze.
  System commit.
  ^ obexRefPath