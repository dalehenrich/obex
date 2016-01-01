instance count analysis
analyzeClassInstanceCount
  sortedClassInstanceCountList := self
    sortClassInstanceCount: classInstanceCount
    instances: classInstanceCountAndInstances.
  self summary at: 'classes instances' put: sortedClassInstanceCountList size