tests
testObexConnectedToCommand
  "run without errors"

  | oop |
  oop := ObexTestResource current simpleLeaves asOop.
  self
    evaluateCommandString: 'obex --help connectedTo';
    evaluateCommandString:
        'obex connectedTo --type=oopSet --st=`ObexTestResource current simpleLeaves`';
    evaluateCommandString: 'obex connectedTo --type=array ' , oop printString;
    evaluateCommandString: 'obex connectedTo --type=set ' , oop printString;
    evaluateCommandString: 'obex connectedTo --type=oopArray ' , oop printString;
    evaluateCommandString: 'obex connectedTo --type=oopSet ' , oop printString;
    evaluateCommandString:
        'obex connectedTo --name=`hello world` --type=set ' , oop printString;
    evaluateCommandString:
        'obex instances --name=`test resource classes` --type=array ObexTestObject';
    evaluateCommandString:
        'obex connectedTo --type=oopArray --dataSource=`test resource classes`';
    evaluateCommandString:
        'obex instances --type=oopArray ObexTestObject ObexTestObjectArray; obex connectedTo --type=oopArray';
    yourself