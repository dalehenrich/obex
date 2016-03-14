obex inventory
obexinventory
  "
  obex inventory [--max=<max-sessions>] [--pct=<pct-cpu-limit>] [--st=<st-expression> | oop...] 
"

  | maxSessions percentCpu objects |
  self
    getSubcommandOptsMixedLongShort:
      {#('max' nil #'required').
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
  objects := subOptions
    at: 'st'
    ifPresent: [ :expression | expression evaluate ]
    ifAbsent: [ (subArguments collect: [ :oop | Object _objectForOop: oop asNumber ]) asArray ].
  objects isEmpty
    ifTrue: [ self obexInventoryRepository: maxSessions percentCpu: percentCpu ]
    ifFalse: [ 
      self
        obexInventoryCollection: objects
        maxSessions: maxSessions
        percentCpu: percentCpu ]