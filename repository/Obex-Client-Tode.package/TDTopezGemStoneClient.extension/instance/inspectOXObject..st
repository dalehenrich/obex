*obex-client-tode
inspectOXObject: aTDPPINode
	| oopType |
	oopType := self session
		rawReceiverNB: (self session asOopType: aTDPPINode myOop)
		perform: #inspectOXObject
		withArgs: #().
	^ self session library localFor: oopType