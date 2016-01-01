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
  obex view

DESCRIPTION
OPTIONS

EXAMPLES
  obex view
'.
  ^ manPage