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
  obex inventory [--max=<max-sessions>] [--pct=<pct-cpu-limit>]

DESCRIPTION

EXAMPLES
  obex inventory
  obex view --limit=20 --inventory=instances
  obex view --limit=20 --inventory=bytes
'.
  ^ manPage