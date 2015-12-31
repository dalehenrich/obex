obex
obexview
  "
  obex view [--globalName=<cache-name>]
"

  | globalName obexRefPath clientRoassalElement |
  self getSubcommandOptsMixedLongShort: {#('globalName' nil #'required')}.
  globalName := self obexGlobalName.
  obexRefPath := UserGlobals at: globalName.
  clientRoassalElement := OXTodeClientElement new
    theObject: obexRefPath;
    usePersistentClientElementCache: false;
    windowBuilder: self;
    editorAspectSelector: #'activateRoassalEditor';
    editorWindowLabel: 'xxx';
    editorWindowLocation: #'method';
    topez: self topez;
    timestamp;
    yourself.
  clientRoassalElement
    childrenBlock: [ :cre :aTDPPINode | 
          self topez objectSerializer
            toString:
              (self obexProcessNodes: aTDPPINode children asArray for: clientRoassalElement) ];
    parentsBlock: [ :cre :aTDPPINode | 
          self topez objectSerializer
            toString:
              (self obexProcessNodes: aTDPPINode parents asArray for: clientRoassalElement) ];
    initialNodes:
        (self obexProcessNodes: obexRefPath searchNodeMap keys for: clientRoassalElement).
  self topez cacheClientElement: clientRoassalElement.
  self topez editElement: clientRoassalElement