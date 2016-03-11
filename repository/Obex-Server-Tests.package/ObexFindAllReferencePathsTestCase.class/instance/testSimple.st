tests
testSimple
  | tool leaves dataStore |
  leaves := ObexTestResource current simpleLeaves.
  System commit.
  tool := self obexTool.
  tool obexFindAllReferencePathsToObjects: leaves asArray.
  dataStore := tool obexDataStoreRoot referencePaths top