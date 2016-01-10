instance creation
for: anObject in: aReferencePathDataStore
  | theClassName nodeLabel theNode |
  nodeLabel := nil.
  anObject isBehavior
    ifTrue: [ theClassName := anObject name ]
    ifFalse: [ 
      theClassName := anObject class name.
      nodeLabel := self customNodeLabelFor: anObject theClassName: theClassName ].
  theNode := self new
    oop: anObject asOop;
    className: theClassName;
    nodeLabel: nodeLabel;
    referencePathDataStore: aReferencePathDataStore;
    yourself.
  (anObject isBehavior and: [ anObject isMeta ])
    ifTrue: [ 
      "a Metaclass is kept alive by references to the nonMetaclass, so add a node for which additional reference paths can by dynamically created and added to graph"
      theNode
        addParent:
          (OXMetaclassReferenceNode
            for: anObject theNonMetaClass
            in: aReferencePathDataStore) ].
  ^ theNode