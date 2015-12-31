Querying
isLogBeginDataRecord
	"LOG_BEGIN_DATA_RECORD defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel	and: [recordKind == 5	]) ifTrue: [^true].
	(1 < compatibilityLevel 		and: [recordKind == 2	]) ifTrue: [^true].
	^false.
