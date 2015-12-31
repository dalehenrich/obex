Querying
isLogAbortLogoutRecord
	"LOG_ABORT_LOGOUT_RECORD defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	840 < compatibilityLevel ifTrue: [^false].	"no longer defined"
	(compatibilityLevel = 840 and: [recordKind = 49]) ifTrue: [^true].
	^false.
