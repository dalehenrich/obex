analysis
scanBackupForClassInstanceCountAndInstanceSamples: backupPath sampleLimit: sampleLimit
  | scanBackup |
  scanBackup := OXScanBackup64ForClassCountAndInstanceOops new.
  scanBackup
    sampleLimit: sampleLimit;
    path: backupPath.
  classInstanceCount := scanBackup classes.
  classInstanceCountAndInstances := scanBackup classInstanceSamples