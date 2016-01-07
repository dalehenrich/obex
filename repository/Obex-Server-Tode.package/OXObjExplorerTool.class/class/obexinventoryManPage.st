obex
obexinventoryManPage
  | manPage |
  manPage := TDManPage
    commandName: 'inventory'
    sourceMethod: self name asString , '>>obexinventory'
    fromString:
      'NAME
  obex inventory - GsObjectInventory analysis

SYNOPSIS
  obex inventory [--max=<max-sessions>] [--pct=<pct-cpu-limit>] (--bytes | --count)

DESCRIPTION

EXAMPLES
  obex inventory --count
  obex view --inventory
'.
  ^ manPage