tests
testObexObjectsCommand
  "run without errors"

  | oop |
  oop := ObexTestResource current simpleLeaves asOop.
  self
    evaluateCommandString: 'obex --help objects';
    evaluateCommandString:
        'obex objects --type=oopSet --st=`ObexTestResource current simpleLeaves`';
    evaluateCommandString: 'obex objects --type=array ' , oop printString;
    evaluateCommandString: 'obex objects --type=set ' , oop printString;
    evaluateCommandString: 'obex objects --type=oopArray ' , oop printString;
    evaluateCommandString: 'obex objects --type=oopSet ' , oop printString;
    evaluateCommandString: 'obex objects --type=asis ' , oop printString;
    evaluateCommandString:
        'obex objects --name=`hello world` --type=set ' , oop printString;
    evaluateCommandString:
        'eval `{Object new}`; obex objects --type=array; obex objects --type=oopArray';
    yourself