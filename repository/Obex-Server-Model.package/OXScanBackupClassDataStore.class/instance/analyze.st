analysis
analyze
  sortedClassInstanceCountList := self
    sortClassInstanceCount: classInstanceCount.
  self summary at: self summaryLabel put: sortedClassInstanceCountList size