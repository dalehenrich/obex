analysis
analyzeReferenceGsBitmap: aGsBitmap node: node
  aGsBitmap
    _doAsOops: [ :referenceOop | 
      | theNode |
      theNode := self lookupNodeForOop: referenceOop rootNode: false.
      node addParent: theNode.
      theNode addChild: node ].
  self commit