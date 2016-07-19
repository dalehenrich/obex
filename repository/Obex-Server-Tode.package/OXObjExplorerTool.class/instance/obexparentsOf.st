obex parentsOf
obexparentsOf
  "
  obex parentsOf [--name=<dataStore-name>] [--exclude=<st-expression>] [--static] \
                 [--maxSessions=<max-sessions> | --aggressive] [--st=<st-expression> | oop...]
"

  "browse method --spec `OXObjExplorerTool class>>obexparentsOfManPage`"

  | excluded objectsArray dataStoreNameOrNil maxSessions |
  self
    getSubcommandOptsMixedLongShort:
      {#('name' nil #'required').
      #('st' nil #'required').
      #('exclude' nil #'required').
      #('aggressive' nil #'none').
      #('maxSessions' nil #'required').
      #('static' nil #'none')}.
  maxSessions := subOptions
    at: 'maxSessions'
    ifPresent: [ :max | maxSessions := max asNumber ]
    ifAbsent: [ 
      subOptions
        at: 'aggressive'
        ifPresent: [ :max | maxSessions := SystemRepository _aggressiveMaxThreadCount ]
        ifAbsent: [ self defaultMaxSessions ] ].
  excluded := subOptions
    at: 'exclude'
    ifPresent: [ :expression | expression evaluate ]
    ifAbsent: [ {} ].
  objectsArray := self
    handleObjectsArrayOptionsSubArgsCollect: [ :oop | Object _objectForOop: oop asNumber ].
  dataStoreNameOrNil := subOptions
    at: 'name'
    ifPresent: [ :dataStoreName | dataStoreName ]
    ifAbsent: [  ].
  ^ subOptions
    at: 'static'
    ifPresent: [ :ignored | 
      self
        obexStaticParentsOf: objectsArray
        named: dataStoreNameOrNil
        excluded: excluded
        withMaxSessions: maxSessions ]
    ifAbsent: [ 
      self
        obexParentsOf: objectsArray
        named: dataStoreNameOrNil
        excluded: excluded
        withMaxSessions: maxSessions ]