instance count analysis
scanBackupForClassInstanceCountAndInstanceSamples: backupPath sampleClass: sampleClass limit: limit
  | scanBackup sampleClassOop |
  scanBackup := OXScanBackup64 new.
  classInstanceCount := IntegerKeyValueDictionary new.
  classInstanceCountAndInstances := IntegerKeyValueDictionary new.
  sampleClassOop := sampleClass asOop.
  scanBackup
    processBlock: [ :logHdr :logRecord | 
      self
        addObjectCountTo: classInstanceCount
        instanceSamplesTo: classInstanceCountAndInstances
        sampleClassOop: sampleClassOop
        limit: limit
        from: logRecord ].
  scanBackup path: backupPath.
  self classOopToClassMap.
  self analyzeClassInstanceCount