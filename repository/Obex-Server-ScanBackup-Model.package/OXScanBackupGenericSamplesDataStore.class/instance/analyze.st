analysis
analyze
  sortedClassInstanceCountList := self
    sortClassInstanceCount: classInstanceCount
    instances: classInstanceCountAndInstances.
  self summary at: self summaryLabel put: sortedClassInstanceCountList size