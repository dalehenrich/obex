Accessing
originalLogBirthTime

	| timeGmt |
	(timeGmt := self int32At: 33) == 0 ifTrue: [^nil].
	^DateTime newWithYear: 1970 dayOfYear: 0 seconds: timeGmt.
