analysis
scanBackup: backupPath sampleClass: sampleClass limit: limit
  | scanBackup sampleClassOop |
  classInstanceCount := IntegerKeyValueDictionary new.
  classInstanceCountAndInstances := IntegerKeyValueDictionary new.
  sampleClass ifNotNil: [ sampleClassOop := sampleClass asOop ].
  scanBackup := OXScanBackup64
    path: backupPath
    processBlock: [ :logHdr :logRecord | 
      self
        addObjectCountTo: classInstanceCount
        instanceSamplesTo: classInstanceCountAndInstances
        sampleClassOop: sampleClassOop
        limit: limit
        from: logRecord ].
  self classOopToClassMap.
  self analyze