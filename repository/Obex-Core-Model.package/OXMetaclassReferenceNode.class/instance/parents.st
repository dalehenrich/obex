accessing
parents
  true
    ifTrue: [ ^ super parents ].
  parents
    ifNil: [ 
      parents := self clientElement
        ifNotNil: [ :ce | ce parentsFor: self ]
        ifNil: [ self calculateParents ] ].
  ^ parents