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
  obex view --detective | --classes=<class-limit> | --refs=<class-limit>

DESCRIPTION
OPTIONS

EXAMPLES
  obex view --detective
  obex view --classes=20
  obex view --refs=20
'.
  ^ manPage