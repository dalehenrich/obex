Querying
isLogPreCheckpointRecord
	"LOG_PRE_CHECKPOINT_RECORD defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel	and: [recordKind == 12	]) ifTrue: [^true].
	(compatibilityLevel == 840	and: [recordKind == 7	]) ifTrue: [^true].
	^false.
