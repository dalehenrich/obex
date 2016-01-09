obex orphans
obexClassesWithInstances
  | inventory classesWithInstances |
  System commit.
  inventory := GsObjectInventory fastProfileRepository.
  classesWithInstances := IdentitySet new.
  inventory entriesByCount
    do: [ :entry | classesWithInstances add: entry theClass ].
  ^ classesWithInstances