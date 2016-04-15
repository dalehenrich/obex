obex viewX
obexViewBytesCount: obexByteCountDataStore filter: filter limit: limit
  self
    obexViewClassHistogram: obexByteCountDataStore
    sorted: obexByteCountDataStore sortedClassByteCountList
    label: 'Bytes count'
    selector: #'byteCount'
    filter: filter
    limit: limit