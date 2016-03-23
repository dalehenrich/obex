*obex-server-34x-tests
testObexObjectsBitmapCommand
  "run without errors"

  | oop |
  oop := ObexTestResource current someData asOop.
  self
    evaluateCommandString: 'obex objects ' , oop printString;
    evaluateCommandString:
        'obex objects --type=bitmap --st=`ObexTestResource current someData`';
    evaluateCommandString: 'obex objects --type=bitmap ' , oop printString;
    evaluateCommandString:
        'obex objects --name=`hello world` --type=bitmap ' , oop printString;
    evaluateCommandString: 'eval `{Object new}`; obex objects; obex objects';
    yourself