*obex-server-34x-tests
testObexInstancesBitmapCommand
  "run without errors"

  self
    evaluateCommandString:
        'obex instances ObexTestSomeObject ObexTestSomeObjectByte';
    evaluateCommandString:
        'obex instances --type=bitmap --st=`{ObexTestSomeObject.  ObexTestSomeObjectByte}`';
    evaluateCommandString:
        'obex instances --type=bitmap ObexTestSomeObject ObexTestSomeObjectByte';
    evaluateCommandString:
        'obex instances --name=`hello world` --type=bitmap ObexTestSomeObject ObexTestSomeObjectByte';
    evaluateCommandString:
        'eval `{ObexTestSomeObject. ObexTestSomeObjectByte}`; obex instances';
    yourself