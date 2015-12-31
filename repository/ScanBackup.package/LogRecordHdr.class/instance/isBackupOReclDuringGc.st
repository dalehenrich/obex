Querying
isBackupOReclDuringGc
	"LOG_BACKUP_O_RECL_DURING_GC defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel 	and: [recordKind == 209	]) ifTrue: [^true].
	(compatibilityLevel == 830	and: [recordKind == 22		]) ifTrue: [^true].
	^false.
