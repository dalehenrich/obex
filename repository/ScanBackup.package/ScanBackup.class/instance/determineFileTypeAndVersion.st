other
determineFileTypeAndVersion

	| physicalRecordHeader rootRecord start middle end |
	start := file position.	"0"
	physicalRecordHeader := self physicalRecordHeader.		"24 bytes in 64-bit, 28 bytes in 32-bit"
	physicalRecordHeader isBackupRecord ifFalse: [self error: 'Expected a backup record'].
	rootRecord := LogRootRecord from: file.						"352 bytes"
	middle := file position.
	end := start + physicalRecordHeader recordSize.
	self readRecords: physicalRecordHeader numLogicalRecords - 1.
	file skip: end - file position.
