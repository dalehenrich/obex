instance count analysis
scanBackupForClassInstanceCountAndInstanceSamples: backupPath sampleLimit: sampleLimit
  | scanBackup |
  scanBackup := OXScanBackup64 new.
  classInstanceCount := IntegerKeyValueDictionary new.
  classInstanceCountAndInstances := IntegerKeyValueDictionary new.
  scanBackup
    processBlock: [ :logHdr :logRecord | 
      self
        addObjectCountTo: classInstanceCount
        instanceSamplesTo: classInstanceCountAndInstances
        sampleLimit: sampleLimit
        from: logRecord ].
  scanBackup path: backupPath.
  self classOopToClassMap.
  self analyzeClassInstanceCount