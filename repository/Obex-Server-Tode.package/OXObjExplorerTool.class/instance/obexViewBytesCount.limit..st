obex view
obexViewBytesCount: obexByteCountDataStore limit: limit
  | clientElement viewLimit |
  clientElement := OXHistogramClientElement new
    graphicLabel: 'Bytes count';
    dataPointSelector: #'byteCount';
    theObject: obexByteCountDataStore;
    usePersistentClientElementCache: true;
    windowBuilder: self;
    editorAspectSelector: #'activateObjectExplorerEditor';
    editorWindowLabel: 'xxx';
    editorWindowLocation: #'method';
    topez: self topez;
    timestamp;
    yourself.
  obexByteCountDataStore sortedClassByteCountList isEmpty
    ifTrue: [ self error: 'There are no elements in the byte count list' ].
  viewLimit := limit min: obexByteCountDataStore sortedClassByteCountList size.
  clientElement
    dataPoints:
      (obexByteCountDataStore sortedClassByteCountList copyFrom: 1 to: viewLimit).
  self topez cacheClientElement: clientElement.
  self topez editElement: clientElement