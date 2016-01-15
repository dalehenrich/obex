obex inventory
obexInventoryRepository: maxSessions percentCpu: percentCpu
  | objInventory |
  objInventory := GsObjectInventory
    _objInventory: maxSessions
    waitForLock: 3
    pageBufSize: 8
    percentCpuActiveLimit: percentCpu
    showHiddenClasses: true
    aHiddenSet: 0
    listInstances: nil
    toFile: nil.
  self
    obexInventory: objInventory
    maxSessions: maxSessions
    percentCpu: percentCpu