obex
obexinventory
  "
  obex inventory [--max=<max-sessions>] [--pct=<pct-cpu-limit>] 
"

  | maxSessions percentCpu objInventory dataStore classToOopMap |
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
  classToOopMap := StringKeyValueDictionary new.
  objInventory entriesByCount
    do: [ :entry | 
      | clsOop ds |
      clsOop := entry theClass asOop.
      (classToOopMap at: entry theClass name ifAbsentPut: [ {} ]) add: entry.
      ds := OXObjectInventoryDataPoint new
        className: entry theClass printString;
        classOop: clsOop;
        instanceCount: entry instanceCount;
        byteCount: entry byteCount;
        label;
        yourself.
      dataStore objectInventory at: clsOop put: ds ].
  (classToOopMap values select: [ :each | each size ~~ 1 ]) inspect.
  self obexDataStoreRoot objectInventory push: dataStore