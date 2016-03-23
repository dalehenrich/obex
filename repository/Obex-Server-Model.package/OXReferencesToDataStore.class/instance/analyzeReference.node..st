analysis
analyzeReference: referenceObject node: node
  | theNode |
  referenceObject isCommitted
    ifFalse: [ ^ self ].
  (self excludedArray includes: referenceObject)
    ifTrue: [ ^ self ].
  theNode := self lookupNodeForObject: referenceObject rootNode: false.
  node addParent: theNode.
  theNode addChild: node.
  self commit