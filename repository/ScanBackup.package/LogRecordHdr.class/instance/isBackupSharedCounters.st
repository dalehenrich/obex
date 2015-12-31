Querying
isBackupSharedCounters
	"LOG_BACKUP_SHARED_COUNTERS defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel	and: [recordKind == 212	]) ifTrue: [^true].
	(compatibilityLevel == 830	and: [recordKind == 53		]) ifTrue: [^true].
	^false.
