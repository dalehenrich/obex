Querying
isBackupRootRecord
	"LOG_BACKUP_ROOT_RECORD defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel	and: [recordKind == 201	]) ifTrue: [^true].
	(compatibilityLevel == 830	and: [recordKind == 13		]) ifTrue: [^true].
	(compatibilityLevel = 62	and: [recordKind == 12		]) ifTrue: [^true].
	^false.
