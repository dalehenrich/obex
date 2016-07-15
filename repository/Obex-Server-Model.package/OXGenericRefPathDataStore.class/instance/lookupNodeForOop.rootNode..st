lookup
lookupNodeForOop: referenceOop rootNode: createRootNode
  ^ oopToNodeMap
    at: referenceOop
    ifPresent: [ :existingNode | existingNode ]
    ifAbsent: [ 
      | referenceNode referenceObject |
      referenceObject := Object _objectForOop: referenceOop.
      referenceNode := createRootNode
        ifTrue: [ self rootNodeClass for: referenceObject in: self ]
        ifFalse: [ self referenceNodeClass for: referenceObject in: self ].
      oopToNodeMap at: referenceOop put: referenceNode.
      referenceNode ]