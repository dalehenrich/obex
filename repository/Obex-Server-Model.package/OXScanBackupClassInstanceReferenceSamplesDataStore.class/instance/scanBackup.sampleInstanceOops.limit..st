analysis
scanBackup: backupPath sampleInstanceOops: sampleInstanceOops limit: limit
  | scanBackup |
  classInstanceCount := IntegerKeyValueDictionary new.
  classInstanceCountAndInstances := IntegerKeyValueDictionary new.
  scanBackup := OXScanBackup64
    path: backupPath
    processBlock: [ :logHdr :logRecord | 
      self
        addObjectCountTo: classInstanceCount
        instanceSamplesTo: classInstanceCountAndInstances
        sampleInstanceOops: sampleInstanceOops
        limit: limit
        from: logRecord ].
  self classOopToClassMap.
  self analyze