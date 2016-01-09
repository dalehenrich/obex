*obex-server-34x-tode
obexViewSpectroDective: obexDataStore
  | dataStore leaves classInstanceCountsAndInstances |
  dataStore := obexDataStore objectInventory top.
  classInstanceCountsAndInstances := dataStore sortedClassInstanceCountList.
  classInstanceCountsAndInstances := classInstanceCountsAndInstances
    copyFrom: 1
    to: (dataStore parentLimit min: classInstanceCountsAndInstances size).
  leaves := classInstanceCountsAndInstances
    collect: [ :dp | 
      (OXObjectInventoryDataPointNode for: dp nodeType: #'leaf' label: dp printString)
        parentLimit: dataStore parentLimit;
        dataSource: dataStore;
        yourself ].
  self obexViewDective: dataStore initalNodes: leaves