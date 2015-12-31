Accessing
oldBirthHostId

	| hostID |
	hostID := bytes copyFrom: 21 to: 24.
	^self swizzleLongTransform asArray = #(0 1 2 3)
		ifTrue: [hostID reverse]
		ifFalse: [hostID].
