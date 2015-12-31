Querying
isBackupStartCheckpoint
	"LOG_BACKUP_START_CHECKPOINT defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel	and: [recordKind == 203	]) ifTrue: [^true].
	(compatibilityLevel == 830	and: [recordKind == 15		]) ifTrue: [^true].
	(compatibilityLevel = 62	and: [recordKind == 14		]) ifTrue: [^true].
	^false.
