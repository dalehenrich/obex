*obex-server-scanbackup-tode
obexViewInstancesDective: obexDataStore
  | dataStore leaves classInstanceCountsAndInstances |
  dataStore := obexDataStore scanBackups top.
  classInstanceCountsAndInstances := dataStore sortedClassInstanceCountList.
  classInstanceCountsAndInstances := classInstanceCountsAndInstances
    copyFrom: 1
    to: (dataStore parentLimit min: classInstanceCountsAndInstances size).
  leaves := classInstanceCountsAndInstances
    collect: [ :dp | 
      (OXDynamicClassInstanceDataPointNode
        for: dp
        nodeType: #'leaf'
        label: dp printString)
        backupPath: dataStore backupPath;
        parentLimit: dataStore parentLimit;
        dataSource: dataStore;
        yourself ].
  self obexViewDective: dataStore initalNodes: leaves