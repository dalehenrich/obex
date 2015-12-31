obex
obexviewManPage
  | manPage |
  manPage := TDManPage
    commandName: 'view'
    sourceMethod: self name asString , '>>obexview'
    fromString: 'NAME
  obex view - Browse reference paths to given objects

SYNOPSIS
  obex view [--globalName=<cache-name>]

DESCRIPTION
OPTIONS

EXAMPLES
  obex view
  obex view --globalName=PpiRefPathCache 
'.
  ^ manPage