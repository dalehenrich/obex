Querying
isBackupDbgIds
	"LOG_BACKUP_DBG_IDS defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel 	and: [recordKind == 210	]) ifTrue: [^true].
	(compatibilityLevel == 830	and: [recordKind == 23		]) ifTrue: [^true].
	^false.
