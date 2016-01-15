obex inventory
obexInventory: objInventory maxSessions: maxSessions percentCpu: percentCpu
  | dataStore entries |
  dataStore := OXObjectInventoryDataStore new
    maxThreads: maxSessions;
    maxCpuUsage: percentCpu;
    yourself.
  entries := objInventory entriesByCount.
  entries := entries copyFrom: (entries size - 100 max: 1) to: entries size.
  entries
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