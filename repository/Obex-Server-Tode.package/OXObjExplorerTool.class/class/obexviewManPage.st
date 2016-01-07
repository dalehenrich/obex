obex
obexviewManPage
  | manPage |
  manPage := TDManPage
    commandName: 'view'
    sourceMethod: self name asString , '>>obexview'
    fromString:
      'NAME
  obex view - Visualize object reference graphs and class instance counts

SYNOPSIS
  obex view --detective 
  obex view --scan=<class-limit>
  obex view --inventory=instances|bytes [--limit=<sample-limit>] 

DESCRIPTION
OPTIONS

EXAMPLES
  obex view --detective
  obex view --scan=20
  obex view --limit=20 --inventory=bytes
  obex view --limit=20 --inventory=instances
'.
  ^ manPage