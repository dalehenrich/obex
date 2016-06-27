tests
testObexReferencePathsCommandOld
  "run without errors"

  | oop |
  PersistentRoot := ObexTestResource current someData.
  System commit.
  oop := PersistentRoot asOop.
  self
    evaluateCommandString: 'obex --help referencePaths';
    evaluateCommandString: 'obex referencePaths --old ' , oop printString;
    evaluateCommandString:
        'obex referencePaths --old  --st=`ObexTestResource current someData`';
    evaluateCommandString:
        'obex referencePaths --old  --maxPaths=1 --st=`ObexTestResource current someData`';
    evaluateCommandString:
        'obex referencePaths --old  --name=someData --st=`ObexTestResource current someData`';
    evaluateCommandString:
        'eval `ObexTestResource current someData`; obex referencePaths --old  --limit=`OXAllReferencePathsDataStore minLimitSetForRefPathScan, {ObexTestResource current}`';
    yourself