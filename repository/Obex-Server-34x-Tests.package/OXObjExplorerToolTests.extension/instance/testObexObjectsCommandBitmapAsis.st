*obex-server-34x-tests
testObexObjectsCommandBitmapAsis
  "ensure that asis type is viable"

  | oop |
  oop := ObexTestResource current someData asOop.
  self
    evaluateCommandString:
        'obex objects --name=classes --type=asis --st=`{ObexTestObject. ObexTestObjectArray}`';
    evaluateCommandString: 'obex dataStore classes; obex connectedTo';
    yourself