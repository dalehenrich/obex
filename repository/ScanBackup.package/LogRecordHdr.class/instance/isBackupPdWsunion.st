Querying
isBackupPdWsunion
	"LOG_BACKUP_PD_WSUNION defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel 	and: [recordKind == 208	]) ifTrue: [^true].
	(compatibilityLevel == 830	and: [recordKind == 20		]) ifTrue: [^true].
	(CompatibilityLevel == 62	and: [recordKind = 18		]) ifTrue: [^true].
	^false.
