Querying
isLogDebugInfo
	"LOG_DEBUG_INFO defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel	and: [recordKind == 101	]) ifTrue: [^true].
	^recordKind == 10
