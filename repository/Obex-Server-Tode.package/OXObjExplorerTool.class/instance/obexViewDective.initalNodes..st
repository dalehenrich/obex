obex view
obexViewDective: dataStore initalNodes: initialNodes
  | clientElement |
  clientElement := OXPointerDetectiveClientElement new
    theObject: dataStore;
    usePersistentClientElementCache: true;
    windowBuilder: self;
    editorAspectSelector: #'activateObjectExplorerEditor';
    editorWindowLabel: 'xxx';
    editorWindowLocation: #'method';
    topez: self topez;
    timestamp;
    yourself.
  clientElement
    childrenBlock: [ :cre :anOXGenericNode | 
          self topez objectSerializer
            toString: (self obexProcessNodes: anOXGenericNode children asArray) ];
    parentsBlock: [ :cre :anOXGenericNode | 
          self topez objectSerializer
            toString: (self obexProcessNodes: anOXGenericNode parents asArray) ];
    initialNodes: (self obexProcessNodes: initialNodes).
  self topez cacheClientElement: clientElement.
  self topez editElement: clientElement