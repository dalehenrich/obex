obex references
obexreferences
  "
  obex references [--name=<dataStore-name>] [--memory] [--exclude=<st-expression>]
                  [--st=<st-expression> | oop...]
"

  "browse method --spec `OXObjExplorerTool class>>obexreferencesManPage`"

  | excluded objectsArray dataStoreNameOrNil |
  self
    getSubcommandOptsMixedLongShort:
      {#('name' nil #'required').
      #('st' nil #'required').
      #('exclude' nil #'required').
      #('memory' nil #'none')}.
  excluded := subOptions
    at: 'exclude'
    ifPresent: [ :expression | expression evaluate ]
    ifAbsent: [ {} ].
  objectsArray := self
    handleObjectsArrayOptionsSubArgsCollect: [ :oop | Object _objectForOop: oop asNumber ].
  dataStoreNameOrNil := subOptions
    at: 'name'
    ifPresent: [ :dataStoreName | dataStoreName ]
    ifAbsent: [  ].
  ^ subOptions
    at: 'memory'
    ifPresent: [ :ignored | 
      self
        obexInMemoryReferencesTo: objectsArray
        named: dataStoreNameOrNil
        excluded: excluded ]
    ifAbsent: [ self obexReferencesTo: objectsArray named: dataStoreNameOrNil excluded: excluded ]