*obex-server-34x-tests
testObexInstancesBitmapCommand
  "run without errors"

  self
    evaluateCommandString: 'obex instances ObexTestObject ObexTestObjectArray';
    evaluateCommandString:
        'obex instances --type=bitmap --st=`{ObexTestObject.  ObexTestObjectArray}`';
    evaluateCommandString:
        'obex instances --type=bitmap ObexTestObject ObexTestObjectArray';
    evaluateCommandString:
        'obex instances --name=`hello world` --type=bitmap ObexTestObject ObexTestObjectArray';
    evaluateCommandString:
        'eval `{ObexTestObject. ObexTestObjectArray}`; obex instances';
    yourself