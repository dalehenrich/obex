*obex-server-34x-tode
obexViewSpectro: obexDataStore sortKey: sortKey
  | dataStore leaves |
  dataStore := obexDataStore objectInventory top.
  leaves := self obexViewSpectroPrepareLeaves: obexDataStore sortKey: sortKey.
  self obexViewDective: dataStore initalNodes: leaves