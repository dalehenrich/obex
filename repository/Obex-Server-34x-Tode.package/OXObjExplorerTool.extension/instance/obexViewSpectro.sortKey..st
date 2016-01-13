*obex-server-34x-tode
obexViewSpectro: obexDataStore sortKey: sortKey
  | dataStore leaves samples sel |
  dataStore := obexDataStore objectInventory top.
  samples := sortKey = 'instances'
    ifTrue: [ 
      sel := #'instanceCount'.
      dataStore sortedClassInstanceCountList ]
    ifFalse: [ 
      sel := #'byteCount'.
      dataStore sortedClassByteCountList ].
  samples := samples copyFrom: 1 to: (dataStore parentLimit min: samples size).
  leaves := samples
    collect: [ :dp | 
      | label |
      label := dp theClassLabel , ', ' , (dp perform: sel) printString.
      (OXSpectroDataPointNode for: dp nodeType: #'leaf' label: label)
        parentLimit: dataStore parentLimit;
        dataSource: dataStore;
        sortKey: sortKey;
        yourself ].
  self obexViewDective: dataStore initalNodes: leaves