obex inventory
obexInventoryCollection: aCollectionOfObjects maxSessions: maxSessions percentCpu: percentCpu
  | coll |
  System truncateHiddenSet: 41 toSize: 0.
  coll := aCollectionOfObjects reject: [ :each | each isSpecial ].
  System addAll: coll asArray toHiddenSet: 41.
  self
    obexInventoryHiddenSet: 41
    maxSessions: maxSessions
    percentCpu: percentCpu