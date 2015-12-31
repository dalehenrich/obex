Utility
initialize

	header := LogRecordHdr bytes: (bytes copyFrom: 1 to: LogRecordHdr byteSize).
	CompatibilityLevel := self compatibilityLevel.
	self initializeSwizzle.
	header isBackupRootRecord ifFalse: [self error: 'Expected backup root record'].
