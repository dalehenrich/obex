*obex-client-tode
inspectReifiedOXObject: anOXNode
	| oopType |
	oopType := self session
		rawReceiverNB: (self session asOopType: self topezServerOop)
		perform: #inspectReifiedOXObject:
		withArgs: {(self session asOopType: anOXNode myOop)}.
	^ self session library localFor: oopType