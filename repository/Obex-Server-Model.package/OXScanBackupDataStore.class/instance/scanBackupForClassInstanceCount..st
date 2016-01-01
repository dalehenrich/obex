instance count analysis
scanBackupForClassInstanceCount: backupPath
  | scanBackup |
  scanBackup := OXScanBackup64 new path: backupPath.
  classInstanceCount := scanBackup classes.
  classInstanceCountAndInstances := Dictionary new.
  self classOopToClassMap.
  self analyzeClassInstanceCount