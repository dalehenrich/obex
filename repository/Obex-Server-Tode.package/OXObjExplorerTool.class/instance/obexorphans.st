obex orphans
obexorphans
  "
  obex orphans [--max=<max-sessions>] [--pct=<pct-cpu-limit>]               
"

  | maxSessions percentCpu originalMetaclasses metaclasses obsoleteMetaclasses publishedClassNames selectedMetaclasses classesByName duplicatedClasses excludedMetaclasses results defs orphans metaclassesWithInstances metaclassesWithoutInstances classOopMap orphanLabels |
  self
    getSubcommandOptsMixedLongShort:
      {#('max' nil #'required').
      #('pct' nil #'required')}.
  subOptions
    at: 'max'
    ifPresent: [ :arg | maxSessions := arg asInteger ]
    ifAbsent: [ maxSessions := 1 ].
  subOptions
    at: 'pct'
    ifPresent: [ :arg | percentCpu := arg asInteger ]
    ifAbsent: [ percentCpu := 90 ].
  System commit.
  results := SystemRepository
    listInstances: {Metaclass3}
    limit: 0
    toDirectory: nil
    withMaxThreads: maxSessions
    maxCpuUsage: percentCpu
    memoryOnly: false.
  classOopMap := IntegerKeyValueDictionary new.
  (results at: 2) do: [ :each | classOopMap at: each asOop put: each name ].
  originalMetaclasses := metaclasses := (results at: 2)
    collect: [ :each | each asOop ].
  obsoleteMetaclasses := self obexObsoleteMetaclasses
    collect: [ :each | 
      classOopMap at: each asOop put: each name.
      each asOop ].
  metaclassesWithInstances := (self obexClassesWithInstances
    collect: [ :each | each class ])
    collect: [ :each | 
      classOopMap at: each asOop put: each name.
      each asOop ].
  metaclasses := metaclasses
    reject: [ :each | obsoleteMetaclasses includes: each ].
  metaclassesWithoutInstances := metaclasses
    reject: [ :each | metaclassesWithInstances includes: each ].
  publishedClassNames := ClassOrganizer new classes
    collect: [ :each | each name ].
  selectedMetaclasses := {}.
  excludedMetaclasses := {}.
  metaclasses
    do: [ :each | 
      (publishedClassNames includes: (classOopMap at: each))
        ifTrue: [ selectedMetaclasses add: each ]
        ifFalse: [ excludedMetaclasses add: each ] ].
  classesByName := Dictionary new.
  selectedMetaclasses
    do: [ :each | 
      (classesByName at: each thisClass name ifAbsentPut: [ Array new ])
        add: each thisClass ].
  duplicatedClasses := classesByName select: [ :each | each size > 1 ].
  false
    ifTrue: [ 
      defs := metaclasses
        collect: [ :each | TDClassDefinition fromClassWithHistory: each theNonMetaClass ].
      orphans := defs
        select: [ :each | each isKindOf: TDBehaviorReferenceDefinition ] ]
    ifFalse: [ 
      orphans := metaclassesWithInstances
        select: [ :each | 
          | cls |
          cls := Object _objectForOop: each.
          (TDClassDefinition fromClassWithHistory: cls theNonMetaClass)
            isKindOf: TDBehaviorReferenceDefinition ].
      orphanLabels := orphans
        collect: [ :each | 
          | cls |
          cls := Object _objectForOop: each.
          (TDClassDefinition fromClassWithHistory: cls theNonMetaClass)
            theClassLabel ] ].
  ^ {originalMetaclasses.
  metaclasses.
  (metaclasses collect: [ :each | classOopMap at: each ]).
  metaclassesWithoutInstances.
  (metaclassesWithoutInstances collect: [ :each | classOopMap at: each ]).
  metaclassesWithInstances.
  (metaclassesWithInstances collect: [ :each | classOopMap at: each ]).
  orphans.
  (orphans collect: [ :each | classOopMap at: each ]).
  orphanLabels}