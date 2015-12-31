Querying
isLogKeepPdWsUnion
	"LOG_KEEP_PD_WS_UNION defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel	and: [recordKind == 11	]) ifTrue: [^true].
	(compatibilityLevel == 840	and: [recordKind == 54	]) ifTrue: [^true].
	^false.
