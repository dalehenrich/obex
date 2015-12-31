Accessing
fileCreationTime

	| timeGmt |
	(timeGmt := self int32At: 25) == 0 ifTrue: [^nil].
	^DateTime newWithYear: 1970 dayOfYear: 0 seconds: timeGmt.
