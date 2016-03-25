*obex-server-34x-tests
testObexParentsOfCommand
  "run without errors"

  | oop |
  PersistentRoot := ObexTestResource current someData.
  System commit.
  oop := PersistentRoot asOop.
  self
    evaluateCommandString: 'obex --help parentsOf';
    evaluateCommandString: 'obex parentsOf ' , oop printString;
    evaluateCommandString:
        'obex parentsOf --st=`ObexTestResource current someData`';
    evaluateCommandString:
        'obex parentsOf --name=someData --st=`ObexTestResource current someData`';
    evaluateCommandString:
        'eval `ObexTestResource current someData`; obex parentsOf';
    yourself