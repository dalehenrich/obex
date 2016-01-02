*obex-client-tode
inspectOXObject: anOXNode
	| oopType |
	oopType := self session
		rawReceiverNB: (self session asOopType: self topezServerOop)
		perform: #inspectOXObject:
		withArgs: {(self session asOopType: anOXNode myOop)}.
	^ self session library localFor: oopType