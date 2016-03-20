*obex-server-34x-tests
testObexConnectedToBitmapCommand
  "run without errors"

  | oop |
  oop := ObexTestResource current simpleLeaves asOop.
  self
    evaluateCommandString: 'obex connectedTo ' , oop printString;
    evaluateCommandString:
        'obex connectedTo --type=bitmap --st=`ObexTestResource current simpleLeaves`';
    evaluateCommandString: 'obex connectedTo --type=bitmap ' , oop printString;
    evaluateCommandString:
        'obex connectedTo --name=`hello world` --type=bitmap ' , oop printString;
    evaluateCommandString:
        'obex instances ObexTestObject ObexTestObjectArray; obex connectedTo';
    yourself