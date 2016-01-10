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
  anObject isBehavior
    ifTrue: [ 
      | syntheticNode |
      syntheticNode := anObject isMeta
        ifTrue: [ 
          "a Metaclass is kept alive by references to the nonMetaclass, so add a node for which additional reference paths can by dynamically created and added to graph"
          OXMetaclassReferenceNode
            for: anObject theNonMetaClass
            in: aReferencePathDataStore ]
        ifFalse: [ 
          "find reference paths does not traverse the metaclass to class instance variable in Metaclass3 
"
          OXClassReferenceNode
            for: anObject theMetaClass
            in: aReferencePathDataStore ].
      theNode addParent: syntheticNode ].
  ^ theNode