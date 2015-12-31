objects
saveObject: anObject at: anInteger

	| objectTable oldObject |
anInteger = 1462294529 ifTrue: [self halt].
	objectTable := ScanLog objectTable.
	oldObject := objectTable at: anInteger ifAbsent: [nil].
	oldObject isNil ifTrue: [
		objectTable at: anInteger put: anObject.
	] ifFalse: [
		oldObject class == LogForwardReference ifTrue: [
			objectTable at: anInteger put: anObject.
			oldObject evaluateBlocks.
		] ifFalse: [
			oldObject become: anObject.
		].
	].
