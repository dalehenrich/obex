Querying
isDataRecord
	"LOG_DATA_RECORD defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel	and: [recordKind == 6	]) ifTrue: [^true].
	(compatibilityLevel == 830	and: [recordKind == 3	]) ifTrue: [^true].
	(compatibilityLevel = 62	and: [recordKind == 3	]) ifTrue: [^true].
	^false.
