menu actions
findReferencePathsMenuAction: listElement selectionIndex: selectionIndex
  | obex dataStore objectArray limitArray |
  obex := listElement topez toolInstanceFor: 'obex'.
  System commit.
  objectArray := {(self object dotSelfObject)}.
  limitArray := OXAllReferencePathsDataStore minLimitSetForRefPathScan.
  objectArray do: [ :each | limitArray remove: each ifAbsent: [  ] ].
  dataStore := OXAllReferencePathsDataStore new
    findAllReferencePathsToObjects: objectArray
      limitObjArray: limitArray
      printToLog: false
      maxPaths: 5;
    yourself.
  obex
    obexViewDective: dataStore
    initalNodes: (obex obexProcessNodes: dataStore searchNodeMap keys).
  ^ true