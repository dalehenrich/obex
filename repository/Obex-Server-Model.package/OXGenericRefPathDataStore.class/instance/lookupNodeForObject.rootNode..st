lookup
lookupNodeForObject: referenceObject rootNode: createRootNode
  ^ oopToNodeMap
    at: referenceObject asOop
    ifPresent: [ :existingNode | existingNode ]
    ifAbsent: [ 
      | referenceNode |
      referenceNode := createRootNode
        ifTrue: [ self rootNodeClass for: referenceObject in: self ]
        ifFalse: [ self referenceNodeClass for: referenceObject in: self ].
      oopToNodeMap at: referenceObject asOop put: referenceNode.
      referenceNode ]