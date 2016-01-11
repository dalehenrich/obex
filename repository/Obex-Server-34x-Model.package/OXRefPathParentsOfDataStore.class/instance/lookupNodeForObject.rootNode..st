lookup
lookupNodeForObject: referenceObject rootNode: createRootNode
  ^ oopToNodeMap
    at: referenceObject asOop
    ifPresent: [ :existingNode | existingNode ]
    ifAbsent: [ 
      | referenceNode |
      referenceNode := createRootNode
        ifTrue: [ OXRootNode for: referenceObject in: self ]
        ifFalse: [ OXReferenceNode for: referenceObject in: self ].
      oopToNodeMap at: referenceObject asOop put: referenceNode.
      referenceNode ]