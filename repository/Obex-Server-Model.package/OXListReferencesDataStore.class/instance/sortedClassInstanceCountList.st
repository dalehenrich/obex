accessing
sortedClassInstanceCountList
  sortedClassInstanceCountList
    ifNil: [ 
      sortedClassInstanceCountList := self
        sortClassInstanceCount: self classInstanceMap ].
  ^ sortedClassInstanceCountList