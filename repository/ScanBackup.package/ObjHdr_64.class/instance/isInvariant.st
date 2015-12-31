Flags
isInvariant

	^self isbigEndian
		ifTrue: [(self rawFlags bitAnd: 2r10000000) = 2r10000000]
		ifFalse: [self halt].
