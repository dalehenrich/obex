Querying
isLogDataRecord_64
	"LOG_DATA_RECORD defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel	and: [recordKind == 6	]) ifTrue: [^true].
	(compatibilityLevel == 840 and: [recordKind == 3	]) ifTrue: [^true].
	^false.
