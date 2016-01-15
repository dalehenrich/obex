obex inventory
obexInventoryCollection: aCollectionOfObjects maxSessions: maxSessions percentCpu: percentCpu
  | objInventory |
  System truncateHiddenSet: 41 toSize: 0.
  System addAll: aCollectionOfObjects asArray toHiddenSet: 41.
  objInventory := GsObjectInventory
    _objInventory: maxSessions
    waitForLock: 3
    pageBufSize: 8
    percentCpuActiveLimit: percentCpu
    showHiddenClasses: true
    aHiddenSet: 41
    listInstances: nil
    toFile: nil.
  self
    obexInventory: objInventory
    maxSessions: maxSessions
    percentCpu: percentCpu