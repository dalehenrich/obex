obex view
obexview
  "
  obex view --detective=(reference|instances|spectro)
  obex view --limit=<sample-limit> --scan
  obex view --limit=<sample-limit>  --inventory=instances|bytes 
"

  self
    getSubcommandOptsMixedLongShort:
      {#('detective' nil #'required').
      #('scan' nil #'none').
      #('limit' nil #'required').
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
              type = 'spectro'
                ifTrue: [  ]
                ifFalse: [ 
                  self
                    error:
                      'Unknown detective type: ' , type printString , '. See man page for more info.' ] ] ] ]
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
            obexViewClassInstancesCount: self obexDataStoreRoot scanBackups top
            limit: limit ]
        ifAbsent: [ 
          subOptions
            at: 'inventory'
            ifPresent: [ :sortKey | 
              sortKey = 'instances'
                ifTrue: [ 
                  self
                    obexViewClassInstancesCount:
                      self obexDataStoreRoot objectInventory top
                    limit: limit ]
                ifFalse: [ 
                  sortKey = 'bytes'
                    ifTrue: [ self obexViewBytesCount: self obexDataStoreRoot objectInventory top limit: limit ]
                    ifFalse: [ 
                      self
                        error:
                          'Unknown sort key: ' , sortKey printString , '. See man page for more info' ] ] ]
            ifAbsent: [ self error: 'Missing required options. See man page for more info' ] ] ]