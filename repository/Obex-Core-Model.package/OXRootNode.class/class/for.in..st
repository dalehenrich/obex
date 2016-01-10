instance creation
for: anObject in: aReferencePathDataStore
  | rootNode |
  rootNode := super for: anObject in: aReferencePathDataStore.
  (anObject isBehavior and: [ anObject isMeta ])
    ifTrue: [ 
      "a Metaclass is kept alive by references to the nonMetaclass, so add a node for which additional reference paths can by dynamically created and added to graph"
      rootNode
        addParent:
          (OXMetaclassReferenceNode
            for: anObject theNonMetaClass
            in: aReferencePathDataStore) ].
  ^ rootNode