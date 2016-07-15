analysis
analyzeReferenceParentsInfo: parentsInfo node: node
  node
    additionalParentsAvailable: parentsInfo additionalParentsAvailable;
    targetFoundInSearch: parentsInfo targetFoundInSearch;
    yourself.
  parentsInfo parentOops
    _doAsOops: [ :referenceOop | 
      | theNode |
      theNode := self lookupNodeForOop: referenceOop rootNode: false.
      node addParent: theNode.
      theNode addChild: node ].
  self commit