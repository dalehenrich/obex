objects
processSymbol

	self saveObject: (object copyFrom: 1 to: objectHeader length) asString asSymbol.
