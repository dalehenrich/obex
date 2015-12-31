Flags
isClass

	^self isbigEndian
		ifTrue: [(self rawFlags bitAnd: 2r10) = 2r10]
		ifFalse: [self halt].
