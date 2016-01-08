analysis
scanBackup: aPath sampleClasses: sampleClasses limit: limit
  | sampleClassOops |
  classInstanceCount := IntegerKeyValueDictionary new.
  classInstanceCountAndInstances := IntegerKeyValueDictionary new.
  sampleClassOops := #().
  sampleClasses
    ifNotNil: [ sampleClassOops := (sampleClasses collect: [ :cl | cl asOop ]) asIdentitySet ].
  scanner := OXScanBackup64 new.
  self commit.	"make scanner persistent"
  scanner
    processBlock: [ :logHdr :logRecord | 
          self
            addObjectCountTo: classInstanceCount
            instanceSamplesTo: classInstanceCountAndInstances
            sampleClassOops: sampleClassOops
            limit: limit
            from: logRecord ];
    path: aPath.
  self clearScanner.
  self classOopToClassMap.
  self analyze