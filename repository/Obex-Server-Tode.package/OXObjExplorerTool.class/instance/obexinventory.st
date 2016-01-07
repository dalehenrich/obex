obex
obexinventory
  "
  obex inventory [--max=<max-sessions>] [--pct=<pct-cpu-limit>] (--bytes | --count)
"

  | maxSessions percentCpu objInventory dataStore |
  self
    getSubcommandOptsMixedLongShort:
      {#('bytes' nil #'none').
      #('count' nil #'none').
      #('max' nil #'required').
      #('pct' nil #'required')}.
  subOptions
    at: 'max'
    ifPresent: [ :arg | maxSessions := arg asInteger ]
    ifAbsent: [ maxSessions := 1 ].
  subOptions
    at: 'pct'
    ifPresent: [ :arg | percentCpu := arg asInteger ]
    ifAbsent: [ percentCpu := 90 ].
  objInventory := GsObjectInventory
    _objInventory: maxSessions
    waitForLock: 3
    pageBufSize: 8
    percentCpuActiveLimit: percentCpu
    showHiddenClasses: true
    aHiddenSet: 0
    listInstances: nil
    toFile: nil.
  dataStore := OXObjectInventoryDataStore new.
  subOptions
    at: 'count'
    ifPresent: [ :ignored | 
      objInventory entriesByCount
        do: [ :entry | 
          | clsOop |
          clsOop := entry theClass asOop.
          dataStore classOopToClassMap at: clsOop put: entry theClass.
          dataStore classInstanceCount at: clsOop put: entry instanceCount ] ]
    ifAbsent: [ 
      self halt: 'not implemented'.
      objInventory entriesByBytes ].
  self obexDataStore objectInventory push: dataStore