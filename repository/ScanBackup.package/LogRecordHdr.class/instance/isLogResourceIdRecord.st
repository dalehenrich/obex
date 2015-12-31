Querying
isLogResourceIdRecord
	"LOG_RESOURCE_ID_RECORD defined in logdisk.ht"

	(CompatibilityLevel = 840 and: [self recordKind = 4]) ifTrue: [^true].
	^false.