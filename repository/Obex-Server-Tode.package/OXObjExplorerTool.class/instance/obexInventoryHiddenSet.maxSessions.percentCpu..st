obex inventory
obexInventoryHiddenSet: hiddenSetNumber maxSessions: maxSessions percentCpu: percentCpu
  "hiddenSetNumber == 0 --- inventory entire repository"

  | objInventory |
  objInventory := GsObjectInventory
    _objInventory: maxSessions
    waitForLock: 3
    pageBufSize: 8
    percentCpuActiveLimit: percentCpu
    showHiddenClasses: true
    aHiddenSet: hiddenSetNumber
    listInstances: nil
    toFile: nil
    inMemoryOnly: false.
  ^ self
    obexInventory: objInventory
    maxSessions: maxSessions
    percentCpu: percentCpu