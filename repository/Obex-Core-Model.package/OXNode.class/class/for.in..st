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
    dataSource: aReferencePathDataStore;
    yourself.
  self addSyntheticNodeFor: anObject in: aReferencePathDataStore to: theNode.
  ^ theNode