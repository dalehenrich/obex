accessing
label
  label ifNil: [ label := self classDefinition theClassLabel ].
  ^ label