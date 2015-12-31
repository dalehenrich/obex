Querying
isLogGcLock
	"LOG_GC_LOCK defined in logdisk.ht"

	(CompatibilityLevel = 840 and: [self recordKind = 45]) ifTrue: [^true].
	^false.