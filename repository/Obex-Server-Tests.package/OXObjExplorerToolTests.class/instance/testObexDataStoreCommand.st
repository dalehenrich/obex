tests
testObexDataStoreCommand
  "run without errors"

  | oop |
  oop := ObexTestResource current someData asOop.
  self
    evaluateCommandString: 'obex --help dataStore';
    evaluateCommandString:
        'obex objects --name=test --type=array ' , oop printString;
    evaluateCommandString: 'obex dataStore --stackId=objects';
    evaluateCommandString: 'obex dataStore test';
    yourself