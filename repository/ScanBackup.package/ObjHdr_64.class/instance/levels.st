Flags
levels

	^self isbigEndian
		ifTrue: [(self rawFlags bitAnd: 2r1100) // 2r100]
		ifFalse: [self halt].
