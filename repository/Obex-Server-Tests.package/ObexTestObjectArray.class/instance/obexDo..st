enumerating
obexDo: aBlock
  aBlock value: self.
  self do: [ :each | each obexDo: aBlock ]