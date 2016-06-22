obex referencePaths
obexreferencePaths
  "
  obex referencePaths [--name=<dataStore-name>] [--maxPaths=<max-ref-paths>] [--limit=<st-expression>] [--old]
                      [--st=<st-expression> | oop...]
"

  | objects maxPaths dataStore limitArray |
  self
    getSubcommandOptsMixedLongShort:
      {#('st' nil #'required').
      #('maxPaths' nil #'required').
      #('name' nil #'required').
      #('limit' nil #'required').
      #('old' nil #'none').
      #('st' nil #'required')}.
  subOptions
    at: 'maxPaths'
    ifPresent: [ :arg | maxPaths := arg asNumber ]
    ifAbsent: [ maxPaths := 32 ].
  objects := self
    handleObjectsArrayOptionsSubArgsCollect: [ :oop | Object _objectForOop: oop asNumber ].
  System commit.
  limitArray := subOptions
    at: 'limit'
    ifPresent: [ :expression | expression evaluate ]
    ifAbsent: [ OXAllReferencePathsDataStore minLimitSetForRefPathScan ].
  objects do: [ :each | limitArray remove: each ifAbsent: [  ] ].
  ^ subOptions
    at: 'old'
    ifPresent: [ :ignored | 
      self
        obexFindAllReferencePathsToObjects: objects
        limitObjArray: limitArray
        maxPaths: maxPaths ]
    ifAbsent: [ 
      self
        obexAllReferencePathsToObjects: objects
        limits: limitArray
        maxPaths: maxPaths ]