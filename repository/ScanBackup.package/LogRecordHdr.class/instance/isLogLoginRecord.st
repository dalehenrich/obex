Querying
isLogLoginRecord
	"LOG_LOGIN_RECORD defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel	and: [recordKind == 3	]) ifTrue: [^true].
	(compatibilityLevel == 840	and: [recordKind == 51	]) ifTrue: [^true].
	^false.
