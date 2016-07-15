*obex-client-tode
inspectOXNode: anOXNode
	| oopType |
	oopType := self session
		rawReceiverNB: (self session asOopType: self topezServerOop)
		perform: #inspectOXNode:
		withArgs: {(self session asOopType: anOXNode myOop)}.
	^ self session library localFor: oopType