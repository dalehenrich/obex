analysis
analyzeReferenceParentsInfo: parentsInfo node: node
  super analyzeReferenceParentsInfo: parentsInfo node: node.
  parentsInfo parentOops
    _doAsOops: [ :referenceOop | 
      | theNode parentsInfo |
      theNode := self lookupNodeForOop: referenceOop rootNode: false.
      parentsInfo := SystemRepository _refPathParentsOf: referenceOop.
      parentsInfo parentOops isEmpty
        ifTrue: [ self halt ].
      node addParent: theNode.
      theNode addChild: node ].
  self commit