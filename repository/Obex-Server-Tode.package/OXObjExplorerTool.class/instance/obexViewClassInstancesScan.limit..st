obex view
obexViewClassInstancesScan: obexScan limit: limit
  | clientElement viewLimit |
  clientElement := OXClassInstanceCountClientElement new
    theObject: obexScan;
    usePersistentClientElementCache: false;
    windowBuilder: self;
    editorAspectSelector: #'activateObjectExplorerEditor';
    editorWindowLabel: 'xxx';
    editorWindowLocation: #'method';
    topez: self topez;
    timestamp;
    yourself.
  obexScan sortedClassInstanceCountList isEmpty
    ifTrue: [ self error: 'There are no elements in the instance count list' ].
  viewLimit := limit min: obexScan sortedClassInstanceCountList size.
  clientElement
    dataPoints:
      (obexScan sortedClassInstanceCountList copyFrom: 1 to: viewLimit).
  self topez cacheClientElement: clientElement.
  self topez editElement: clientElement