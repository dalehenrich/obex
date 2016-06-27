*obex-server-34x-tests
testObexReferencePathsCommand
  "run without errors"

  | oop |
  PersistentRoot := ObexTestResource current someData.
  System commit.
  oop := PersistentRoot asOop.
  self
    evaluateCommandString: 'obex --help referencePaths';
    evaluateCommandString: 'obex referencePaths ' , oop printString;
    evaluateCommandString:
        'obex referencePaths --st=`ObexTestResource current someData`';
    evaluateCommandString:
        'obex referencePaths --maxPaths=1 --st=`ObexTestResource current someData`';
    evaluateCommandString:
        'obex referencePaths --name=someData --st=`ObexTestResource current someData`';
    evaluateCommandString:
        'eval `ObexTestResource current someData`; obex referencePaths --limit=`OXAllReferencePathsDataStore minLimitSetForRefPathScan, {ObexTestResource current}`';
    yourself