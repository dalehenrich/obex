objects
processString

	objectHeader isOops ifTrue: [
		"root of a large object"
		^self.
	].
	self saveObject: (object copyFrom: 1 to: objectHeader length) asString.
