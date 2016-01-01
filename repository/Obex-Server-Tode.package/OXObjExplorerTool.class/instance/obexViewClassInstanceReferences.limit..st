obex
obexViewClassInstanceReferences: obexDataStore limit: limit
  | obexScan clientElement |
  obexScan := obexDataStore scanBackups.
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
  obexScan sortedInstanceReferencesCountList isEmpty
    ifTrue: [ self error: 'There are no elements in the instance count list' ].
  clientElement
    dataPoints:
      (obexScan sortedInstanceReferencesCountList copyFrom: 1 to: limit).
  self topez cacheClientElement: clientElement.
  self topez editElement: clientElement