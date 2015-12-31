Querying
isBackupDepmapRecord
	"LOG_BACKUP_DEPMAP_RECORD defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel 	and: [recordKind == 211	]) ifTrue: [^true].
	(compatibilityLevel == 830	and: [recordKind == 24		]) ifTrue: [^true].
	^false.
