obex in-process man pages
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

  [SHOULD HAVE --name and --stackId args for clearing individual datatores] 

EXAMPLES
  obex clear 

SEE ALSO
  obex --help objects
'.
  ^ manPage