obex view
obexViewClassInstancesCount: obexInstanceCountDataStore limit: limit
  | clientElement viewLimit |
  clientElement := OXHistogramClientElement new
    graphicLabel: 'Class instance count';
    dataPointSelector: #'instanceCount';
    theObject: obexInstanceCountDataStore;
    usePersistentClientElementCache: true;
    windowBuilder: self;
    editorAspectSelector: #'activateObjectExplorerEditor';
    editorWindowLabel: 'xxx';
    editorWindowLocation: #'method';
    topez: self topez;
    timestamp;
    yourself.
  obexInstanceCountDataStore sortedClassInstanceCountList isEmpty
    ifTrue: [ self error: 'There are no elements in the instance count list' ].
  viewLimit := limit
    min: obexInstanceCountDataStore sortedClassInstanceCountList size.
  clientElement
    dataPoints:
      (obexInstanceCountDataStore sortedClassInstanceCountList
        copyFrom: 1
        to: viewLimit).
  self topez cacheClientElement: clientElement.
  self topez editElement: clientElement