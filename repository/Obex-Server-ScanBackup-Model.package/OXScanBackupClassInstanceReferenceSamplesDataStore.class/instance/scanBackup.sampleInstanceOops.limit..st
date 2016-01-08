analysis
scanBackup: backupPath sampleInstanceOops: sampleInstanceOops limit: limit
  classInstanceCount := IntegerKeyValueDictionary new.
  classInstanceCountAndInstances := IntegerKeyValueDictionary new.
  scanner := OXScanBackup64 new.
  self commit.	"make scanner persistent"
  scanner
    processBlock: [ :logHdr :logRecord | 
          self
            addObjectCountTo: classInstanceCount
            instanceSamplesTo: classInstanceCountAndInstances
            sampleInstanceOops: sampleInstanceOops
            limit: limit
            from: logRecord ];
    path: backupPath.
  self clearScanner.
  self classOopToClassMap.
  self analyze