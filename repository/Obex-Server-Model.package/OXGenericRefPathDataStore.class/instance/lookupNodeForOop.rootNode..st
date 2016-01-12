lookup
lookupNodeForOop: referenceOop rootNode: createRootNode
  ^ oopToNodeMap
    at: referenceOop
    ifPresent: [ :existingNode | existingNode ]
    ifAbsent: [ 
      | referenceNode |
      referenceNode := createRootNode
        ifTrue: [ OXRootNode forOop: referenceOop in: self ]
        ifFalse: [ OXReferenceNode forOop: referenceOop in: self ].
      oopToNodeMap at: referenceOop put: referenceNode.
      referenceNode ]