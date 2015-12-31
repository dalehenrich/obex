other
determineFileTypeAndVersion

	| physRecordHdr logRecordHdr rootRecord |
	physRecordHdr := LogPhysRecordHdr_64 from: file.
	logRecordHdr := LogRecordHdr from: file.
	rootRecord := (TranLogRootRecord from: file)
		header: logRecordHdr;
		fileId: (fileId := physRecordHdr fileId);
		blockId: 0;
		recordId: 0;
		yourself.
	physRecordHdr recordSize = 512 ifFalse: [self halt].
	file skip: physRecordHdr recordSize - file position.
