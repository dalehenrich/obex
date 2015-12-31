Accessing
currentLogBirthTime

	| timeGmt |
	(timeGmt := self int32At: 49) == 0 ifTrue: [^nil].
	^DateTime newWithYear: 1970 dayOfYear: 0 seconds: timeGmt.
