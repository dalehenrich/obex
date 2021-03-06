obex viewX
obexviewX
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
    ifPresent: [ :type | 
      type = 'instances'
        ifTrue: [ self obexViewInstancesDective: self obexDataStoreRoot ]
        ifFalse: [ 
          type = 'reference'
            ifTrue: [ self obexViewReferenceDective: self obexDataStoreRoot ]
            ifFalse: [ 
              type = 'parents'
                ifTrue: [ 
                  (self respondsTo: #'obexViewParentsDective:')
                    ifFalse: [ 
                      self
                        error:
                          '`parents` option not available in the version of GemStone. See man page for more info.' ].
                  self obexViewParentsDective: self obexDataStoreRoot ]
                ifFalse: [ 
                  self
                    error:
                      'Unknown detective type: ' , type printString , '. See man page for more info.' ] ] ] ]
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
            at: 'scan'
            ifPresent: [ :ignored | 
              self
                obexViewClassInstancesCount:
                  self obexDataStoreRoot scanBackups top
                limit: limit ]
            ifAbsent: [ 
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
                ifAbsent: [ self error: 'Missing required options. See man page for more info' ] ] ] ]