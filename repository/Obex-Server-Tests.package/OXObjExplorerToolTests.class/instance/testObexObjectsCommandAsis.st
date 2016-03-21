tests
testObexObjectsCommandAsis
  "ensure that asis type is viable"

  | oop |
  oop := ObexTestResource current simpleLeaves asOop.
  self
    evaluateCommandString:
        'obex objects --name=asis --type=asis ' , oop printString;
    evaluateCommandString: 'obex dataStore asis; obex objects --type=oopArray';
    evaluateCommandString:
        'obex objects --name=classes --type=asis --st=`{ObexTestObject. ObexTestObjectArray}`';
    evaluateCommandString: 'obex dataStore classes; obex instances --type=array';
    evaluateCommandString:
        'obex objects --type=asis --st=`{ObexTestObject. ObexTestObjectArray}`';
    evaluateCommandString:
        'obex dataStore --stackId=objects; obex instances --type=array';
    evaluateCommandString:
        'obex objects --name=leaves --type=asis --st=`ObexTestResource current simpleLeaves`';
    evaluateCommandString:
        'obex dataStore leaves; obex connectedTo --type=oopArray';
    yourself