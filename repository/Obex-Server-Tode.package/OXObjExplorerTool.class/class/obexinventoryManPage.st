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
  obex inventory [--max=<max-sessions>] [--pct=<pct-cpu-limit>] [--st=<st-expression> | oop...] 

DESCRIPTION
  With no --st option or oop list, run object inventory on entiry repository.

EXAMPLES
  obex inventory
  obex view --limit=20 --inventory=instances
  obex view --limit=20 --inventory=bytes

  obex inventory --st=`ObexTestResource current simpleLeaves`
  obex view --limit=20 --inventory=instances
  obex view --limit=20 --inventory=bytes
'.
  ^ manPage