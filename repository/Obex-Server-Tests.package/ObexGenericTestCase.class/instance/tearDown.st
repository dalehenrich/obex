running
tearDown
  super tearDown.
  self obexTool obexDataStoreRoot: oldDataStoreRoot.
  System commit