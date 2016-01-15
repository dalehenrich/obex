obex inventory
obexinventory
  "
  obex inventory [--max=<max-sessions>] [--pct=<pct-cpu-limit>] 
"

  | maxSessions percentCpu |
  self
    getSubcommandOptsMixedLongShort:
      {#('max' nil #'required').
      #('pct' nil #'required')}.
  subOptions
    at: 'max'
    ifPresent: [ :arg | maxSessions := arg asInteger ]
    ifAbsent: [ maxSessions := self obexDefaultObjectInventoryMaxSessions ].
  subOptions
    at: 'pct'
    ifPresent: [ :arg | percentCpu := arg asInteger ]
    ifAbsent: [ percentCpu := self obexDefaultObjectInventoryPercentCpu ].
  self obexInventoryRepository: maxSessions percentCpu: percentCpu