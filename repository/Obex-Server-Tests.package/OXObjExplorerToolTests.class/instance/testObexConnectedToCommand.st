tests
testObexConnectedToCommand
  "run without errors"

  | oop |
  oop := ObexTestResource current someData asOop.
  self
    evaluateCommandString: 'obex --help connectedTo';
    evaluateCommandString:
        'obex connectedTo --type=oopSet --st=`ObexTestResource current someData`';
    evaluateCommandString: 'obex connectedTo --type=array ' , oop printString;
    evaluateCommandString: 'obex connectedTo --type=set ' , oop printString;
    evaluateCommandString: 'obex connectedTo --type=oopArray ' , oop printString;
    evaluateCommandString: 'obex connectedTo --type=oopSet ' , oop printString;
    evaluateCommandString: 'obex connectedTo ' , oop printString;
    evaluateCommandString:
        'obex connectedTo --name=`hello world` --type=set ' , oop printString;
    evaluateCommandString:
        'obex instances --type=oopArray ObexTestSomeObject ObexTestSomeObjectByte; obex connectedTo --type=oopArray';
    yourself