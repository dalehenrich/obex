instance creation
forOop: anOop in: aReferencePathDataStore
  | anObject theClassName nodeLabel theNode |
  nodeLabel := nil.
  anObject := Object _objectForOop: anOop.
  anObject isBehavior
    ifTrue: [ theClassName := anObject name ]
    ifFalse: [ 
      theClassName := anObject class name.
      nodeLabel := self customNodeLabelFor: anObject theClassName: theClassName ].
  theNode := self new
    oop: anOop;
    className: theClassName;
    nodeLabel: nodeLabel;
    dataSource: aReferencePathDataStore;
    yourself.
  self addSyntheticNodeFor: anObject in: aReferencePathDataStore to: theNode.
  ^ theNode