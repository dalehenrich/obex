other
readPhysicalRecord

	| physicalRecordHeader start end |
	start := file position.
	(physicalRecordHeader := self physicalRecordHeader) isNil ifTrue: [^self].
	end := start + physicalRecordHeader recordSize.
	self readRecords: physicalRecordHeader numLogicalRecords.
	file skip: end - file position.
