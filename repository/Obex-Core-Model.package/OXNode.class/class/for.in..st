instance creation
for: anObject in: aReferencePathDataStore
  | theClassName nodeLabel |
  nodeLabel := nil.
  anObject isBehavior
    ifTrue: [ theClassName := anObject name ]
    ifFalse: [ 
      theClassName := anObject class name.
      anObject class == SymbolDictionary
        ifTrue: [ 
          nodeLabel := theClassName , '[' , anObject name printString , ']' , ', '
            , anObject asOop printString ] ].
  ^ self new
    oop: anObject asOop;
    className: theClassName;
    nodeLabel: nodeLabel;
    referencePathDataStore: aReferencePathDataStore;
    yourself