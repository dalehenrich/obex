other
physicalRecordHeader

	| header |
	header := self logPhysRecordHdrClass from: file.
	header isLogRecord ifTrue: [^header].
	header isEmptyRecord ifTrue: [
		file skip: 512 - 24.
		^nil.
	].
	self error: 'File is not a transaction log!'.
