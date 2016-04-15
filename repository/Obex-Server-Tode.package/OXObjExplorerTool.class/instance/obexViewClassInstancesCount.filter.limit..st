obex viewX
obexViewClassInstancesCount: obexInstanceCountDataStore filter: filter limit: limit
  self
    obexViewClassHistogram: obexInstanceCountDataStore
    sorted: obexInstanceCountDataStore sortedClassInstanceCountList
    label: 'Class instance count'
    selector: #'instanceCount'
    filter: filter
    limit: limit