analysis
scanBackup: backupPath
  scanner := OXScanBackup64 new.
  self commit.	"make scanner persistent"
  scanner path: backupPath.
  classInstanceCount := scanner classes.
  self clearScanner.
  self classOopToClassMap.
  self analyze