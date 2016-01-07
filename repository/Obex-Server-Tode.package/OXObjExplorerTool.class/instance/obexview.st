obex view
obexview
  "
  obex view --detective | --scan=<class-limit> | --inventory=<class-limit>
"

  self
    getSubcommandOptsMixedLongShort:
      {#('detective' nil #'none').
      #('scan' nil #'required').
      #('inventory' nil #'required')}.
  subOptions
    at: 'detective'
    ifPresent: [ :ignored | self obexViewDective: self obexDataStore ]
    ifAbsent: [ 
      subOptions
        at: 'scan'
        ifPresent: [ :limitArg | 
          self
            obexViewClassInstancesCount: self obexDataStore scanBackups top
            limit: limitArg asNumber ]
        ifAbsent: [ 
          subOptions
            at: 'inventory'
            ifPresent: [ :limitArg | 
              self
                obexViewClassInstancesCount:
                  self obexDataStore objectInventory top
                limit: limitArg asNumber ]
            ifAbsent: [ self error: 'Missing required options. See man page for more info' ] ] ]