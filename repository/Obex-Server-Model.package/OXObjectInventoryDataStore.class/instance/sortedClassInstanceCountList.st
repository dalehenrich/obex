accessing
sortedClassInstanceCountList
  sortedClassInstanceCountList
    ifNil: [ 
      sortedClassInstanceCountList := self
        sortClassInstanceCount: self objectInventory ].
  ^ sortedClassInstanceCountList