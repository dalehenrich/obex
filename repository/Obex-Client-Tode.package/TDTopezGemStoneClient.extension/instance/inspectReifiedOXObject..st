*obex-client-tode
inspectReifiedOXObject: aTDPPINode
	| oopType |
	oopType := self session
		rawReceiverNB: (self session asOopType: aTDPPINode myOop)
		perform: #inspectReifiedOXObject
		withArgs: #().
	^ self session library localFor: oopType