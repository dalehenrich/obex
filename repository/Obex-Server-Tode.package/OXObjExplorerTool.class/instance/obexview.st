obex view
obexview
  "
  obex view --detective

  obex view --spectro=instances|bytes --limit=<sample-limit>
  obex view --inventory=instances|bytes --limit=<sample-limit> [--filter=<regex-pattern>]
"

  self
    getSubcommandOptsMixedLongShort:
      {#('detective' nil #'none').
      #('filter' nil #'required').
      #('limit' nil #'required').
      #('spectro' nil #'required').
      #('inventory' nil #'required')}.
  subOptions
    at: 'detective'
    ifPresent: [ :ignored | 
      objIn isObexDataStore
        ifTrue: [ 
          objIn isObexDetectiveDataStore
            ifFalse: [ self error: 'objIn is not a detective data store. See man page for details.' ].
          self obexViewDetectiveDataStore: objIn ]
        ifFalse: [ self error: 'objIn is not a data store. See man page for details.' ] ]
    ifAbsent: [ 
      subOptions
        at: 'spectro'
        ifPresent: [ :sortKey | 
          (self respondsTo: #'obexViewSpectro:sortKey:')
            ifFalse: [ 
              self
                error:
                  '`spectro` option not available in the version of GemStone. See man page for more info.' ].
          self obexViewSpectro: self obexDataStoreRoot sortKey: sortKey ]
        ifAbsent: [ 
          | limit |
          subOptions
            at: 'limit'
            ifPresent: [ :limitArg | limit := limitArg asNumber ]
            ifAbsent: [ self error: 'Missing equired option ''limit''.  See man page for more info' ].
          subOptions
            at: 'inventory'
            ifPresent: [ :sortKey | 
              | filter |
              subOptions
                at: 'filter'
                ifPresent: [ :arg | filter := arg ]
                ifAbsent: [ filter := nil ].
              sortKey = 'instances'
                ifTrue: [ 
                  self
                    obexViewClassInstancesCount:
                      self obexDataStoreRoot objectInventory top
                    filter: filter
                    limit: limit ]
                ifFalse: [ 
                  sortKey = 'bytes'
                    ifTrue: [ 
                      self
                        obexViewBytesCount:
                          self obexDataStoreRoot objectInventory top
                        filter: filter
                        limit: limit ]
                    ifFalse: [ 
                      self
                        error:
                          'Unknown sort key: ' , sortKey printString , '. See man page for more info' ] ] ]
            ifAbsent: [ self error: 'Missing required options. See man page for more info' ] ] ]