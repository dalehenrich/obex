running
setupOrphanClass1
  "self reset"

  "self new setupOrphanClass1"

  "Class that is not in it's own class history class history, 
   but it has instances that are still referenced in the system"

  | orpohanClass newClassVersion history |
  orpohanClass := Object
    subclass: 'ObexTestOrphanClass1'
    instVarNames: #(#'iv1')
    classVars: #()
    classInstVars: #()
    poolDictionaries: #()
    inDictionary: ''
    category: 'ORPHAN CLASSES'
    options: #().
  ObexTestOrphanParentClass classVar: orpohanClass new.
  System commit.
  self
    withoutClassMigrationDo: [ 
      newClassVersion := Object
        subclass: 'ObexTestOrphanClass1'
        instVarNames: #(#'iv1' #'iv2')
        classVars: #()
        classInstVars: #()
        poolDictionaries: #()
        inDictionary: ''
        category: 'ORPHAN CLASSES'
        options: #() ].
  history := newClassVersion classHistory.
  [ 1 < history size ] whileTrue: [ history first removeFromClassHistory ].
  System commit.
  orpohanClass removeFromSystem.
  System commit