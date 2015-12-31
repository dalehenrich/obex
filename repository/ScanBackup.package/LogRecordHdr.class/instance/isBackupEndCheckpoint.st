Querying
isBackupEndCheckpoint
	"LOG_BACKUP_END_CHECKPOINT defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel 	and: [recordKind == 204	]) ifTrue: [^true].
	(compatibilityLevel == 830	and: [recordKind == 16		]) ifTrue: [^true].
	(compatibilityLevel == 62	and: [recordKind = 15		]) ifTrue: [^true].
	^false.
