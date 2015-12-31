Querying
isLogGcReleaseLock
	"LOG_GC_LOCK_RELEASE defined in logdisk.ht"

	(CompatibilityLevel = 840 and: [self recordKind = 46]) ifTrue: [^true].
	^false.