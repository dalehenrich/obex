obex parentsOf
obexparentsOf
  "
  obex parentsOf [--name=<dataStore-name>] [--exclude=<st-expression>] [--st=<st-expression> | oop...]
"

  "browse method --spec `OXObjExplorerTool class>>obexparentsOfManPage`"

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
  ^ self
    obexParentsOf: objectsArray
    named: dataStoreNameOrNil
    excluded: excluded