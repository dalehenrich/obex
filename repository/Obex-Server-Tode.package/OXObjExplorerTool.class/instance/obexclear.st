obex
obexclear
  "
  obex clear [--globalName=<cache-name>]
"

  | globalName |
  self getSubcommandOptsMixedLongShort: {#('globalName' nil #'required')}.
  globalName := self obexGlobalName.
  ^ UserGlobals removeKey: globalName ifAbsent: [  ]