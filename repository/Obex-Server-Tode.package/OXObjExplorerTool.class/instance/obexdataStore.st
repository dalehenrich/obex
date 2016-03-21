obex
obexdataStore
  "
  obex dataStore --stackId=objectInventory|objects|parentsOf|referencePaths|spectro | <dataStore-name>
"

  "browse method --spec `OXObjExplorerTool class>>obexdataStoreManPage`"

  self getSubcommandOptsMixedLongShort: {#('stackId' nil #'required')}.
  ^ subOptions
    at: 'stackId'
    ifPresent: [ :dataStoreId | (self obexDataStoreRoot perform: dataStoreId asSymbol) top ]
    ifAbsent: [ 
      subArguments isEmpty
        ifTrue: [ 
          self
            error:
              'Reqiuired argument `dataStore-name` not specified. See man page for details.' ].
      self obexDataStoreRoot dataStoreNamed: (subArguments at: 1) ]