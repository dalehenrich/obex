obex
obexorphansManPage
  | manPage |
  manPage := TDManPage
    commandName: 'orphans'
    sourceMethod: self name asString , '>>obexorphans'
    fromString:
      'NAME
  obex orphans - Find references to instances of Metaclass3 that are not members of a ClassHistory

SYNOPSIS
  obex orphans  [--oops=<oop-limit>]  [--max=<max-sessions>] [--pct=<pct-cpu-limit>]               

DESCRIPTION

EXAMPLES
  obex orphans 
  obex view --detective=orphans
'.
  ^ manPage