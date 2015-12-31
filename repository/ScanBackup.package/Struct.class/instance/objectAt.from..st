objects
objectAt: anInteger from: aByteArray

	| oop |
	oop := self int64At: anInteger - 1 * 8 + 1 in: aByteArray.
	(oop bitAnd: 7) = 1 ifFalse: [^Object _objectForOop: oop].
	^ScanLog objectTable
		at: oop
		ifAbsentPut: [LogForwardReference forOop: oop].
