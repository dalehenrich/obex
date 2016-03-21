tests
testObexClearCommand
  "run without errors"

  self
    evaluateCommandString: 'obex --help clear';
    evaluateCommandString: 'obex clear';
    yourself