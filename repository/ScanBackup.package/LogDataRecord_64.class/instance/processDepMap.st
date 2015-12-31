other
processDepMap

	| record |
self halt.
	record := stream next: 8.
	record asArray = #(5 0 0 0 0 0 0 0) ifTrue: [self halt. ^self].
	self halt.