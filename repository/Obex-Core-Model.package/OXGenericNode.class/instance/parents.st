accessing
parents
  parents
    ifNil: [ 
      self clientElement
        ifNotNil: [ :ce | 
          "client-side call"
          parents := ce parentsFor: self ]
        ifNil: [ 
          parents := IdentitySet new.
          self calculateParents ] ].
  ^ parents