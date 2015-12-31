Querying
isLogDataRecord_32
	"LOG_DATA_RECORD defined in logdisk.ht"

	(CompatibilityLevel = 62 and: [self recordKind = 3]) ifTrue: [^true].
	^false.
