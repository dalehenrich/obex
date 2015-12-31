Querying
isLogCommitRecord
	"LOG_COMMIT_RECORD defined in logdisk.ht"

	| compatibilityLevel recordKind |
	compatibilityLevel := CompatibilityLevel.
	recordKind := self recordKind.
	(840 < compatibilityLevel	and: [recordKind == 7	]) ifTrue: [^true].
	^recordKind == 5
