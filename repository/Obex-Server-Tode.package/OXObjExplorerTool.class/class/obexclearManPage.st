obex
obexclearManPage
  | manPage |
  manPage := TDManPage
    commandName: 'calc'
    sourceMethod: self name asString , '>>obexclear'
    fromString:
      'NAME
  obex clear - Clear reference path cache

SYNOPSIS
  obex clear

DESCRIPTION

EXAMPLES
  obex clear 
'.
  ^ manPage