obex
obexclear
  "
  obex clear
"

  self getSubcommandOptsMixedLongShort: {}.
  UserGlobals removeKey: self obexRootDataStoreName ifAbsent: [  ]