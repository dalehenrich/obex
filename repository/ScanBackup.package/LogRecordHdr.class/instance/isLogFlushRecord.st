Querying
isLogFlushRecord
	"LOG_FLUSH_RECORD defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel	and: [recordKind == 15	]) ifTrue: [^true].
	(compatibilityLevel == 840 and: [recordKind == 9	]) ifTrue: [^true].
	^false.
