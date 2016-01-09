obex orphans
obexObsoleteClasses
  ^ (Globals at: #'ObsoleteClasses' ifAbsent: [ Dictionary new ]) values
    select: [ :each | each isBehavior ]