Accessing
oldOriginalLogbirthHostId

	| hostID |
	hostID := bytes copyFrom: 41 to: 44.
	^self swizzleLongTransform asArray = #(0 1 2 3)
		ifTrue: [hostID reverse]
		ifFalse: [hostID].
