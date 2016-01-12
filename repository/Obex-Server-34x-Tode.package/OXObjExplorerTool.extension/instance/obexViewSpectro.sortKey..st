*obex-server-34x-tode
obexViewSpectro: obexDataStore sortKey: sortKey
  | dataStore leaves samples |
  dataStore := obexDataStore objectInventory top.
  samples := sortKey = 'instances'
    ifTrue: [ dataStore sortedClassInstanceCountList ]
    ifFalse: [ dataStore sortedClassByteCountList ].
  samples := samples copyFrom: 1 to: (dataStore parentLimit min: samples size).
  leaves := samples
    collect: [ :dp | 
      (OXObjectInventoryDataPointNode for: dp nodeType: #'leaf' label: dp printString)
        parentLimit: dataStore parentLimit;
        dataSource: dataStore;
        sortKey: sortKey;
        yourself ].
  self obexViewDective: dataStore initalNodes: leaves