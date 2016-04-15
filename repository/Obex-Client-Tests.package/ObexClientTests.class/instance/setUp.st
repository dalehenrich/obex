running
setUp
	super setUp.
	shell := TDShell sessionDescription: self sessionDescription debugMode: false.
	shell batchMode: true