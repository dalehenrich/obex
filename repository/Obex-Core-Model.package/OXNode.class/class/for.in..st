instance creation
for: anObject in: aReferencePathDataStore
  | theClassName nodeLabel |
  nodeLabel := nil.
  anObject isBehavior
    ifTrue: [ theClassName := anObject name ]
    ifFalse: [ 
      theClassName := anObject class name.
      nodeLabel := self customNodeLabelFor: anObject theClassName: theClassName ].
  ^ self new
    oop: anObject asOop;
    className: theClassName;
    nodeLabel: nodeLabel;
    referencePathDataStore: aReferencePathDataStore;
    yourself