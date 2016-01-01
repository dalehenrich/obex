accessing
scanBackups
  scanBackups ifNil: [ scanBackups := OXScanBackupDataStore new ].
  ^ scanBackups