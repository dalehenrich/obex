tests
testObexClearCommand
	"run without errors"

	| ans1 ans2 |
	ans1 := self evaluateCommandString: 'obex --help clear'.
	ans2 := self evaluateCommandString: 'obex clear'.
	self halt.