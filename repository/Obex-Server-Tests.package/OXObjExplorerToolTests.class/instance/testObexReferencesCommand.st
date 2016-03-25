tests
testObexReferencesCommand
  "run without errors"

  | oop |
  oop := ObexTestResource current someData first asOop.
  self
    evaluateCommandString: 'obex --help references';
    evaluateCommandString: 'obex references ' , oop printString;
    evaluateCommandString:
        'obex references --st=`ObexTestResource current someData`';
    evaluateCommandString:
        'obex references --name=someData --st=`ObexTestResource current someData`';
    evaluateCommandString:
        'eval `ObexTestResource current someData`; obex references --exclude=`{ObexTestResource current}`';
    evaluateCommandString:
        'eval `| a | a := {}. a add: (1-> a). a`; obex references --memory';
    yourself