analysis
analyzeReferenceParentsInfo: parentsInfo node: node
  super analyzeReferenceParentsInfo: parentsInfo node: node.
  parentsInfo parentOops
    _doAsOops: [ :referenceOop | 
      | theNode parentsInfo |
      theNode := self lookupNodeForOop: referenceOop rootNode: false.
      parentsInfo := GsReferencePathParentsInfo _refPathParentsOf: referenceOop.
      theNode
        additionalParentsAvailable: parentsInfo additionalParentsAvailable;
        targetFoundInSearch: parentsInfo targetFoundInSearch;
        yourself.
      node addParent: theNode.
      theNode addChild: node ].
  self commit