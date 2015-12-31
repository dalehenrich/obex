obex
obexclearManPage
  | manPage |
  manPage := TDManPage
    commandName: 'calc'
    sourceMethod: self name asString , '>>obexclear'
    fromString: 'NAME
  obex clear - Clear reference path cache

SYNOPSIS
  obex clear [--globalName=<cache-name>]

DESCRIPTION

EXAMPLES
  obex clear
  obex clear --globalName=PpiRefPathCache 
'.
  ^ manPage