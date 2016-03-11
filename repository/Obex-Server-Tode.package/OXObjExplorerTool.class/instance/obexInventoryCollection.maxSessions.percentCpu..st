obex inventory
obexInventoryCollection: aCollectionOfObjects maxSessions: maxSessions percentCpu: percentCpu
  System truncateHiddenSet: 41 toSize: 0.
  System addAll: aCollectionOfObjects asArray toHiddenSet: 41.
  self
    obexInventoryHiddenSet: 41
    maxSessions: maxSessions
    percentCpu: percentCpu