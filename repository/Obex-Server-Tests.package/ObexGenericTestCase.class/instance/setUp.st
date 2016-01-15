running
setUp
  super setUp.
  oldDataStoreRoot := self obexTool obexDataStoreRoot.
  self obexTool obexDataStoreRoot: OXDataStoreRoot new.
  System commit