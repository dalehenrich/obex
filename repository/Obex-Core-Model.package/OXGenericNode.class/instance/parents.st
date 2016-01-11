accessing
parents
  parents
    ifNil: [ 
      self clientElement
        ifNotNil: [ :ce | parents := ce parentsFor: self ]
        ifNil: [ 
          parents := IdentitySet new.
          self calculateParents ] ].
  ^ parents