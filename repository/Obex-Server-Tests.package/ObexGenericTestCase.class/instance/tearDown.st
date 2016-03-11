running
tearDown
  super tearDown.
  self obexTool obexDataStoreRoot: oldDataStoreRoot.
  PersistentRoot := nil.
  System commit