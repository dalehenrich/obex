Accessing
reposBirthTime

	| timeGmt |
	(timeGmt := self int32At: 13) == 0 ifTrue: [^nil].
	^DateTime newWithYear: 1970 dayOfYear: 0 seconds: timeGmt.
