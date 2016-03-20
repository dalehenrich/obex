obex man pages
obexconnectedToManPage
  | manPage |
  manPage := TDManPage
    commandName: 'connectedTo'
    sourceMethod: self name asString , '>>obexconnectedTo'
    fromString:
      'NAME
  obex connectedTo - New object store derived from objects reachable from given objects

SYNOPSIS
  obex connectedTo [--name=<dataStore-name>] [--type=array|set|oopArray|oopSet|bitmap]
                 --dataSource=<dataStore-name> | --st=<st-expression> | oop...

DESCRIPTION
  The `object connectedTo` command creates a new data source by finding objects reachable from the 
  given objects.

  Objects may be specified as a smalltalk expression (--st), or a list of oops. The smalltalk expression 
  should return a collection of objects or an object that responds to #do:.

  With the --dataSource option you can use another data source as the list of objects.

  For more information on the --type options and data sources, see the `man obex objects`.

EXAMPLES
  obex -h

SEE ALSO
  obex --help connectedTo

  obex connectedTo 26355713 26355457 26420993
  obex connectedTo --st=`{(MetacelloProjectRegistration registry registrations at: 1) projectSpec}`

  obex connectedTo --type=oopArray --st=`ObexTestResource current simpleLeaves`
  obex connectedTo --type=set --st=`ObexTestResource current simpleLeaves`
  obex connectedTo --type=bitmap --st=`ObexTestResource current simpleLeaves`

  obex connectedTo --name=`connected leaf objects` --type=oopArray --st=`ObexTestResource current simpleLeaves`

  obex instances --name=`test resource classes` ObexTestObject ObexTestObjectArray
  obex connectedTo --type=oopArray --dataSource=`test resource classes`
'.
  ^ manPage