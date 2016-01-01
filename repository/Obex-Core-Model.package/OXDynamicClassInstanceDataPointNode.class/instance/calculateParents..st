private
calculateParents: parentNodeType
  | newParents dataStore classInstanceCountsAndInstances |
  dataStore := OXScanBackupClassInstanceReferenceSamplesDataStore new
    scanBackup: self backupPath
    sampleInstanceOops: dataPoint samples
    limit: nil.
  classInstanceCountsAndInstances := dataStore sortedClassInstanceCountList.
  classInstanceCountsAndInstances := classInstanceCountsAndInstances
    copyFrom: 1
    to: (self parentLimit min: classInstanceCountsAndInstances size).
  newParents := classInstanceCountsAndInstances
    collect: [ :dp | 
      (OXDynamicClassInstanceDataPointNode
        for: dp
        nodeType: parentNodeType
        label: dp printString)
        backupPath: self backupPath;
        parentLimit: self parentLimit;
        yourself ].
  ^ newParents asArray