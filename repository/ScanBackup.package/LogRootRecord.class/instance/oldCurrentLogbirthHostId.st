Accessing
oldCurrentLogbirthHostId

	| hostID |
	hostID := bytes copyFrom: 53 to: 56.
	^self swizzleLongTransform asArray = #(0 1 2 3)
		ifTrue: [hostID reverse]
		ifFalse: [hostID].
