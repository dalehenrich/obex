running
setUp
  super setUp.
  oldSimpleDataExcludedParents := ObexTestResource current
    simpleDataExcludedParents.
  ObexTestResource current simpleDataExcludedParents: #().
  System commit