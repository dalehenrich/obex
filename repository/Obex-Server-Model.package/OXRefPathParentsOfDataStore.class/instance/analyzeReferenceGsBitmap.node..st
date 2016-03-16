analysis
analyzeReferenceGsBitmap: aGsBitmap node: node
  aGsBitmap copy
    doAsOops: [ :referenceOop | 
      | theNode |
      theNode := self lookupNodeForOop: referenceOop rootNode: false.
      node addParent: theNode.
      theNode addChild: node ].
  searchNodeMap at: node ifAbsent: [ searchNodeMap at: node put: {} ].	"searchNodeMap keys aren't used, methinks"
  self commit