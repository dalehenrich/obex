running
tearDown
  super tearDown.
  ObexTestResource current
    simpleDataExcludedParents: oldSimpleDataExcludedParents.
  System commit