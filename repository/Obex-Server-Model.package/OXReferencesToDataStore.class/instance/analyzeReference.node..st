analysis
analyzeReference: referenceObject node: node
  | theNode |
  self inMemory
    ifFalse: [ 
      referenceObject isCommitted
        ifFalse: [ ^ self ] ].
  (self excludedArray includesIdentical: referenceObject)
    ifTrue: [ ^ self ].
  theNode := self lookupNodeForObject: referenceObject rootNode: false.
  node addParent: theNode.
  theNode addChild: node.
  self commit