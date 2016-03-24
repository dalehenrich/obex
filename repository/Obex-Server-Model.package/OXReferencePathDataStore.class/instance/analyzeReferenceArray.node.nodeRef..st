analysis
analyzeReferenceArray: ar node: node nodeRef: nodeRef
  | theNode lastNode |
  theNode := lastNode := nil.
  1 to: ar size do: [ :index | 
    | referenceObject |
    referenceObject := ar at: index.
    theNode := self lookupNodeForObject: referenceObject rootNode: index == 1.
    lastNode
      ifNotNil: [ 
        theNode addParent: lastNode.
        lastNode addChild: theNode ].
    lastNode := theNode.
    nodeRef add: theNode ].
  self commit