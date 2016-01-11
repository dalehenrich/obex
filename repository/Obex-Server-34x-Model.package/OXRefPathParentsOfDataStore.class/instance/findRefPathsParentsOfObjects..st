analysis
findRefPathsParentsOfObjects: objects
  System commit.
  SystemRepository _refPathDoScanForParents: objects excludeParentRefs: #().
  objects
    do: [ :anObject | 
      | result |
      result := SystemRepository _refPathParentsOf: anObject.
      self halt ]