Querying
isLogAtomicPromoteRecord
	"LOG_ATOMIC_PROMOTE_DEAD defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel	and: [recordKind == 10	]) ifTrue: [^true].
	(compatibilityLevel == 840	and: [recordKind == 42	]) ifTrue: [^true].
	^false.
