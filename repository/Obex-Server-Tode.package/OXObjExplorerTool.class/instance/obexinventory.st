obex
obexinventory
  "
  obex inventory [--max=<max-sessions>] [--pct=<pct-cpu-limit>]
"

  | maxSessions percentCpu objInventory dataStore |
  self
    getSubcommandOptsMixedLongShort:
      {#('max' nil #'required').
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
  dataStore := OXObjectInventoryDataStore new
    maxThreads: maxSessions;
    maxCpuUsage: percentCpu;
    yourself.
  objInventory entriesByCount
    do: [ :entry | 
      | clsOop ds |
      clsOop := entry theClass asOop.
      ds := OXObjectInventoryDataPoint new
        className: entry theClass printString;
        classOop: clsOop;
        instanceCount: entry instanceCount;
        byteCount: entry byteCount;
        label;
        yourself.
      dataStore objectInventory at: clsOop put: ds ].
  self obexDataStoreRoot objectInventory push: dataStore