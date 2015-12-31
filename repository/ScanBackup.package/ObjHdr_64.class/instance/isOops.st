Flags
isOops

	^self isbigEndian
		ifTrue: [(self rawFlags bitAnd: 2r1) = 2r1]
		ifFalse: [self halt].
