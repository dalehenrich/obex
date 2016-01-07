accessing
sortedClassInstanceCountList
  sortedClassInstanceCountList
    ifNil: [ 
      sortedClassInstanceCountList := self
        sortClassInstanceCount: self classInstanceCount ].
  ^ sortedClassInstanceCountList