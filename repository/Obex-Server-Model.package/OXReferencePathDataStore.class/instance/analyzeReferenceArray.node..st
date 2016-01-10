analysis
analyzeReferenceArray: ar node: node
  | theNode lastNode nodeRef |
  theNode := lastNode := nil.
  nodeRef := {}.
  1 to: ar size do: [ :index | 
    | referenceObject |
    referenceObject := ar at: index.
    theNode := oopToNodeMap
      at: referenceObject asOop
      ifPresent: [ :existingNode | existingNode ]
      ifAbsent: [ 
        | referenceNode |
        referenceNode := index == 1
          ifTrue: [ OXRootNode for: referenceObject in: self ]
          ifFalse: [ OXReferenceNode for: referenceObject in: self ].
        oopToNodeMap at: referenceObject asOop put: referenceNode.
        referenceNode ].
    lastNode
      ifNotNil: [ 
        theNode addParent: lastNode.
        lastNode addChild: theNode ].
    lastNode := theNode.
    nodeRef add: theNode ].
  (searchNodeMap at: node ifAbsent: [ searchNodeMap at: node put: {} ])
    add: nodeRef.
  self commit