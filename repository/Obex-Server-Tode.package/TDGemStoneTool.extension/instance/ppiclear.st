*obex-server-tode
ppiclear
  "
  ppi clear [--globalName=<cache-name>]
"

  | globalName |
  self getSubcommandOptsMixedLongShort: {#('globalName' nil #'required')}.
  globalName := self ppiGlobalName.
  ^ UserGlobals removeKey: globalName ifAbsent: [  ]