Querying
isBackupNotDead
	"LOG_BACKUP_NOT_DEAD defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	840 < compatibilityLevel ifTrue: [^false].	"no longer used"
	(compatibilityLevel == 830	and: [recordKind == 21		]) ifTrue: [^true].
	(compatibilityLevel == 62	and: [recordKind = 20		]) ifTrue: [^true].
	^false.
