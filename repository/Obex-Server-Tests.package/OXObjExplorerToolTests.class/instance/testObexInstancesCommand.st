tests
testObexInstancesCommand
  "run without errors"

  self
    evaluateCommandString: 'obex --help instances';
    evaluateCommandString:
        'obex instances --type=oopSet ObexTestSomeObject ObexTestSomeObjectByte';
    evaluateCommandString:
        'obex instances --type=oopSet --st=`{ObexTestSomeObject. ObexTestSomeObjectByte}`';
    evaluateCommandString:
        'obex instances --type=oopArray ObexTestSomeObject ObexTestSomeObjectByte';
    evaluateCommandString:
        'obex instances ObexTestSomeObject ObexTestSomeObjectByte';
    evaluateCommandString:
        'obex instances --name=`hello world` --type=array ObexTestSomeObject ObexTestSomeObjectByte';
    evaluateCommandString:
        'eval `{ObexTestSomeObject. ObexTestSomeObjectByte}`; obex instances --type=oopArray';
    yourself