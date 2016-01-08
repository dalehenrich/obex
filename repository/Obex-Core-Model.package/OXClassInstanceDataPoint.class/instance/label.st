accessing
label
  label
    ifNil: [ label := self classDefinition theClassLabel , ', ' , instanceCount printString ].
  ^ label