Querying
isLogDeadobjsIdRecord
	"LOG_DEADOBJS_ID_RECORD defined in logdisk.ht"

	(CompatibilityLevel = 840 and: [self recordKind = 38]) ifTrue: [^true].
	^false.