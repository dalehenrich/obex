menu actions
findReferencePathsMenuAction: listElement selectionIndex: selectionIndex
  | obex dataStore |
  obex := listElement topez toolInstanceFor: 'obex'.
  System commit.
  dataStore := OXReferencePathDataStore new
    findAllReferencePathsToObjects: {(self object dotSelfObject)} maxPaths: 1;
    yourself.
  obex
    obexViewDective: dataStore
    initalNodes: (obex obexProcessNodes: dataStore searchNodeMap keys).
  ^ true