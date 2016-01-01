instance reference count analysis
scanBackupForClassInstanceReferenceCountAndInstanceSamples: backupPath instanceClasses: instanceClasses sampleLimit: sampleLimit
  | scanBackup instanceClassOops |
  scanBackup := OXScanBackup64 new.
  instanceReferencesCount := IntegerKeyValueDictionary new.
  instanceReferencesCountAndInstances := IntegerKeyValueDictionary new.
  instanceClasses
    do: [ :cl | 
      instanceReferencesCount at: cl asOop put: IntegerKeyValueDictionary new.
      instanceReferencesCountAndInstances
        at: cl asOop
        put: IntegerKeyValueDictionary new ].
  instanceClassOops := (instanceClasses collect: [ :each | each asOop ])
    asIdentitySet.
  scanBackup
    processBlock: [ :logHdr :logRecord | 
      self
        addInstanceReferenceCountTo: instanceReferencesCount
        instanceSamplesTo: instanceReferencesCountAndInstances
        instanceClassOops: instanceClassOops
        sampleLimit: sampleLimit
        from: logRecord ].
  scanBackup path: backupPath.
  self classOopToClassMap.
  self analyzeInstanceReferenceCount