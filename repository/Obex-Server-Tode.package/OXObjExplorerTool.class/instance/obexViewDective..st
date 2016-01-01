obex
obexViewDective: obexDataStore
  | obexRefPath clientElement |
  obexRefPath := obexDataStore referencePaths top.
  clientElement := OXPointerDetectiveClientElement new
    theObject: obexRefPath;
    usePersistentClientElementCache: false;
    windowBuilder: self;
    editorAspectSelector: #'activateObjectExplorerEditor';
    editorWindowLabel: 'xxx';
    editorWindowLocation: #'method';
    topez: self topez;
    timestamp;
    yourself.
  clientElement
    childrenBlock: [ :cre :aTDPPINode | 
          self topez objectSerializer
            toString:
              (self obexProcessNodes: aTDPPINode children asArray for: clientElement) ];
    parentsBlock: [ :cre :aTDPPINode | 
          self topez objectSerializer
            toString:
              (self obexProcessNodes: aTDPPINode parents asArray for: clientElement) ];
    initialNodes:
        (self obexProcessNodes: obexRefPath searchNodeMap keys for: clientElement).
  self topez cacheClientElement: clientElement.
  self topez editElement: clientElement