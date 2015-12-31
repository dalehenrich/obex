Querying
isBackupPossDeadObjs
	"LOG_BACKUP_POSS_DEAD_OBJS defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	840 < compatibilityLevel ifTrue: [^false].	"no longer used"
	(compatibilityLevel == 830	and: [recordKind == 19		]) ifTrue: [^true].
	(CompatibilityLevel == 62	and: [recordKind = 17		]) ifTrue: [^true].
	^false.
