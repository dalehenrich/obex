running
tearDown
	super tearDown.
	shell ifNotNil: [ shell logout ]