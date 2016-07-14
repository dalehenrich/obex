private
customNodeLabelFor: anObject theClassName: theClassName
  "customize label for certain instances of classes"

  (anObject isKindOf: SymbolDictionary)
    ifTrue: [ 
      ^ theClassName , '[' , anObject name printString , ']' , ', '
        , anObject asOop printString ].
  (anObject isKindOf: GsNMethod)
    ifTrue: [ 
      ^ theClassName , '[' , anObject inClass printString , '>>'
        , anObject selector asString , ']' , ', ' , anObject asOop printString ].
  (anObject isKindOf: Association)
    ifTrue: [ 
      ^ theClassName , '[' , anObject key class printString , ']' , ', '
        , anObject asOop printString ].
  ^ nil