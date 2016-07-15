testing
isRoot
  parents ifNil: [ ^ false ].
  ^ self hasAdditionalParents not and: [ parents isEmpty ]