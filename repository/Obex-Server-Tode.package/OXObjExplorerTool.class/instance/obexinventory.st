obex inventory
obexinventory
  "
  obex inventory [--name=<dataStore-name>] [--max=<max-sessions>] [--pct=<pct-cpu-limit>] 
                 [--repo | --st=<st-expression> | oop...] 
"

  | maxSessions percentCpu dataSource dataStoreNameOrNil |
  self
    getSubcommandOptsMixedLongShort:
      {#('max' nil #'required').
      #('repo' nil #'none').
      #('st' nil #'required').
      #('pct' nil #'required')}.
  subOptions
    at: 'max'
    ifPresent: [ :arg | maxSessions := arg asInteger ]
    ifAbsent: [ maxSessions := self obexDefaultObjectInventoryMaxSessions ].
  subOptions
    at: 'pct'
    ifPresent: [ :arg | percentCpu := arg asInteger ]
    ifAbsent: [ percentCpu := self obexDefaultObjectInventoryPercentCpu ].
  dataSource := subOptions
    at: 'repos'
    ifPresent: [ :ignored | self obexInventoryRepository: maxSessions percentCpu: percentCpu ]
    ifAbsent: [ 
      | objects |
      objects := self
        handleObjectsArrayOptionsSubArgsCollect: [ :oop | Object _objectForOop: oop asNumber ].
      self
        obexInventoryCollection: objects
        maxSessions: maxSessions
        percentCpu: percentCpu ].
  dataStoreNameOrNil := subOptions
    at: 'name'
    ifPresent: [ :dataStoreName | dataStoreName ]
    ifAbsent: [  ].
  self obexAddDataSource: dataSource named: dataStoreNameOrNil