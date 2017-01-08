obex report
obexreport
  "
  obex report --inventory=instances|bytes|name [--limit=<sample-limit>]
"

  | limit |
  self
    getSubcommandOptsMixedLongShort:
      {#('limit' nil #'required').
      #('inventory' nil #'required')}.
  subOptions at: 'limit' ifPresent: [ :limitArg | limit := limitArg asNumber ].
  subOptions
    at: 'inventory'
    ifPresent: [ :sortKey | 
      | labelMap sortSelectorMap |
      sortSelectorMap := Dictionary new
        at: 'bytes' put: #'sortedClassByteCountList';
        at: 'instances' put: #'sortedClassInstanceCountList';
        at: 'name' put: #'name';
        yourself.
      labelMap := Dictionary new
        at: 'bytes' put: 'Class byte count';
        at: 'instances' put: 'Class instance count';
        at: 'name' put: 'Class name';
        yourself.
      ^ self
        obexReportClassInstancesCount:
          self obexDataStoreRoot objectInventory top
        label: (labelMap at: sortKey)
        sortSelector: (sortSelectorMap at: sortKey)
        limit: limit ]
    ifAbsent: [ self error: 'Missing required option ''inventory''. See man page for more info' ]