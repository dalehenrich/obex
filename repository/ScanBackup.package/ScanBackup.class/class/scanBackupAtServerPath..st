other
scanBackupAtServerPath: aString
"
	ScanBackup64 scanBackupAtServerPath: '/opt/gemstone/backups/seaside.bak'.
"
	^self new 
		path: aString;
		report.
