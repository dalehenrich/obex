reference paths
scanBackupForClassInstanceCountAndInstanceSamples: backupPath sampleLimit: sampleLimit
  scanBackups := OXScanBackupDataStore new.
  System commit.
  scanBackups
    scanBackupForClassInstanceCountAndInstanceSamples: backupPath
    sampleLimit: sampleLimit.
  System commit