obex
obexview
  "
  obex view --detective | --classes=<class-limit>
"

  self
    getSubcommandOptsMixedLongShort:
      {#('detective' nil #'none').
      #('classes' nil #'required')}.
  subOptions
    at: 'detective'
    ifPresent: [ :ignored | self obexViewDective: self obexDataStore ]
    ifAbsent: [ 
      subOptions
        at: 'classes'
        ifPresent: [ :limitArg | self obexViewClassInstances: self obexDataStore limit: limitArg asNumber ]
        ifAbsent: [ self error: 'Missing required options. See man page for more info' ] ]