instance reference count analysis
scanBackupForClassInstanceReferenceCountAndInstanceSamples: backupPath instanceClass: instanceClass limit: limit
  | scanBackup sampleInstanceOops sampleOops |
  scanBackup := OXScanBackup64 new.
  instanceReferencesCount := IntegerKeyValueDictionary new.
  instanceReferencesCountAndInstances := IntegerKeyValueDictionary new.
  sampleInstanceOops := IdentitySet new.
  sampleOops := classInstanceCountAndInstances
    at: instanceClass asOop
    ifAbsent: [ #() ].
  sampleInstanceOops addAll: sampleOops.
  scanBackup
    processBlock: [ :logHdr :logRecord | 
      self
        addInstanceReferenceCountTo: instanceReferencesCount
        instanceSamplesTo: instanceReferencesCountAndInstances
        sampleInstanceOops: sampleInstanceOops
        limit: limit
        from: logRecord ].
  scanBackup path: backupPath.
  self classOopToClassMap.
  self analyzeInstanceReferenceCount