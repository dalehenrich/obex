obex man pages
obexclearManPage
  | manPage |
  manPage := TDManPage
    commandName: 'calc'
    sourceMethod: self name asString , '>>obexclear'
    fromString:
      'NAME
  obex clear - Clear obex data stores

SYNOPSIS
  obex clear

DESCRIPTION
  Reset the persistent data stores for obex.

EXAMPLES
  obex -h

  obex clear 

SEE ALSO
  obex --help objects
'.
  ^ manPage