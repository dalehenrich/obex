enumerating
obexDo: aBlock
  aBlock value: self.
  self slot1 obexDo: aBlock.
  self slot2 obexDo: aBlock.
  self slot3 obexDo: aBlock.
  self slot4 obexDo: aBlock