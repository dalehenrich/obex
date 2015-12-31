*obex-client-tode
getParentsForOXTodeClientElement: aOXTodeClientElement node: aTDPPINode
	| oopType stonString |
	oopType := self session
		rawReceiverNB: aOXTodeClientElement parentsBlockOopType
		perform: #value:value:
		withArgs:
			{(aOXTodeClientElement clientElementOopType).
			(aOXTodeClientElement session asOopType: aTDPPINode myOop)}.
	stonString := self session library localFor: oopType.
	^ (self objectSerializer fromString: stonString) do: [ :each | each clientElement: aOXTodeClientElement ]