tests
testObexInstancesCommand
  "run without errors"

  self
    evaluateCommandString: 'obex --help instances';
    evaluateCommandString:
        'obex instances --type=oopSet ObexTestObject ObexTestObjectArray';
    evaluateCommandString:
        'obex instances --type=oopSet --st=`{ObexTestObject.  ObexTestObjectArray}`';
    evaluateCommandString:
        'obex instances --type=oopArray ObexTestObject ObexTestObjectArray';
    evaluateCommandString:
        'obex instances --name=`hello world` --type=array ObexTestObject ObexTestObjectArray';
    yourself