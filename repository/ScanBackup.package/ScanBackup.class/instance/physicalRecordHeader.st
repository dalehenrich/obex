other
physicalRecordHeader

	| header |
	header := self logPhysRecordHdrClass from: file.
	header isBackupRecord ifFalse: [self error: 'File is not a backup!'].
	^header.
