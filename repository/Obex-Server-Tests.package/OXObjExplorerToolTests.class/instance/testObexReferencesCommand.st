tests
testObexReferencesCommand
  "run without errors"

  self
    evaluateCommandString: 'obex --help references';
    evaluateCommandString:
        'obex references --st=`ObexTestResource current someData`';
    evaluateCommandString:
        'obex references --name=someData --st=`ObexTestResource current someData`';
    evaluateCommandString:
        'eval `ObexTestResource current someData`; obex references --exclude=`{ObexTestResource current}`';
    yourself