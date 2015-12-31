Querying
isBackupDataRecord_64
	"LOG_BACKUP_DATA_RECORD defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel 	and: [recordKind == 205	]) ifTrue: [^true].
	(compatibilityLevel == 830	and: [recordKind == 17		]) ifTrue: [^true].
	^false.
