private
addSyntheticNodeFor: anObject in: aReferencePathDataStore to: theNode
  anObject isBehavior
    ifTrue: [ 
      | syntheticNode |
      syntheticNode := anObject isMeta
        ifTrue: [ 
          "a Metaclass is kept alive by references to the nonMetaclass, so add a node for which additional reference paths can by dynamically created and added to graph"
          self metaclassReferenceNodeClass
            for: anObject theNonMetaClass
            in: aReferencePathDataStore ]
        ifFalse: [ 
          "find reference paths does not traverse the metaclass to class instance variable in Metaclass3 
"
          self classReferenceNodeClass
            for: anObject theMetaClass
            in: aReferencePathDataStore ].
      theNode addParent: syntheticNode ]