instance reference count analysis
analyzeInstanceReferenceCount
  sortedInstanceReferencesCountList := self
    sortClassInstanceCount: instanceReferencesCount
    instances: instanceReferencesCountAndInstances.
  self summary
    at: 'classes instance references'
    put: sortedInstanceReferencesCountList size