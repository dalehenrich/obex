Accessing
stnVersion

	| myBytes index |
	myBytes := bytes copyFrom: 81 to: bytes size.
	index := myBytes indexOf: 0.
	^(myBytes copyFrom: 1 to: index - 1) asString.
