analysis
scanBackupForClassInstanceCount: backupPath
  | scanBackup |
  scanBackup := OXScanBackup64ForClassCount new path: backupPath.
  classInstanceCount := scanBackup classes.
  classInstanceCountAndInstances := nil