Flags
isNSC

	^self isbigEndian
		ifTrue: [(self rawFlags bitAnd: 2r1000000) = 2r1000000]
		ifFalse: [self halt].
