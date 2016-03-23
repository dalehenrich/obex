*obex-server-34x-tests
testObexConnectedToBitmapCommand
  "run without errors"

  | oop |
  oop := ObexTestResource current someData asOop.
  self
    evaluateCommandString: 'obex connectedTo ' , oop printString;
    evaluateCommandString:
        'obex connectedTo --type=bitmap --st=`ObexTestResource current someData`';
    evaluateCommandString: 'obex connectedTo --type=bitmap ' , oop printString;
    evaluateCommandString:
        'obex connectedTo --name=`hello world` --type=bitmap ' , oop printString;
    evaluateCommandString:
        'obex instances ObexTestSomeObject ObexTestSomeObjectByte; obex connectedTo';
    yourself