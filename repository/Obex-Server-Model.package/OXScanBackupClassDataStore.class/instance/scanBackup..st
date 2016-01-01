analysis
scanBackup: backupPath
  | scanBackup |
  scanBackup := OXScanBackup64 path: backupPath.
  classInstanceCount := scanBackup classes.
  self classOopToClassMap.
  self analyze