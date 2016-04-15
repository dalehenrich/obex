obex in-process man pages
obexinventoryManPage
  | manPage |
  manPage := TDManPage
    commandName: 'inventory'
    sourceMethod: self name asString , '>>obexinventory'
    fromString:
      'NAME
  obex inventory - New object store derived object inventory of given data source: instance and 
                   byte counts by class

SYNOPSIS
  obex inventory [--name=<dataStore-name>] [--max=<max-sessions>] [--pct=<pct-cpu-limit>] 
                 [--repo | --st=<st-expression> | oop...] 

DESCRIPTION
  With --repo, perform inventory of entire repository

  With --st option return a collection of objects upon which inventory will be performed

  Run inventory on list of oops supplied on command line.

  With none of the above, set, run inventory on list of ojects specified on objIn.

  For information on --name option and data sources, see `man obex dataStore`.

EXAMPLES
  obex inventory --repo

  obex inventory 1245732

  obex inventory --st=`ObexTestResource current someData`

  eval `ObexTestResource current someData`; obex inventory --name=someData

SEE ALSO
  obex --help dataStore
'.
  ^ manPage