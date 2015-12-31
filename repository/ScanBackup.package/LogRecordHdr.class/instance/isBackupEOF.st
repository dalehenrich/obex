Querying
isBackupEOF
	"LOG_BACKUP_EOF_RECORD defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel 	and: [recordKind == 202	]) ifTrue: [^true].
	(compatibilityLevel == 830	and: [recordKind == 14		]) ifTrue: [^true].
	(compatibilityLevel == 62	and: [recordKind = 13		]) ifTrue: [^true].
	^false.
