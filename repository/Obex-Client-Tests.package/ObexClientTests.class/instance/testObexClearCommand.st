tests
testObexClearCommand
	| result |
	result := self evaluateCommandString: 'obex --help clear'.
	self assert: (result isKindOf: Text).
	result := self evaluateCommandString: 'obex clear'.
	self assert: (result isKindOf: Text)