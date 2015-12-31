Querying
isLogCheckpointRecord
	"LOG_CHECKPOINT_RECORD defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel	and: [recordKind == 13	]) ifTrue: [^true].
	(840 == compatibilityLevel	and: [recordKind == 8	]) ifTrue: [^true].
	^false.
