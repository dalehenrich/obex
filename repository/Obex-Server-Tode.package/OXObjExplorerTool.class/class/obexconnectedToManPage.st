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
                   [--st=<st-expression> | oop...]

DESCRIPTION
  The `object connectedTo` command creates a new data source by finding objects reachable from the 
  given objects using Repository>>findObjectsConnectedTo:. Connected objects are those objects found 
  by following the inctances of each of the objects until a leaf object (no references) is encountered.

  Objects may be specified as a smalltalk expression (--st), a list of oops, or from objIn. The smalltalk 
  expression should return a collection of objects or an object that responds to #asArray. objIn must be a
  collection of objects, an object that responds to #asArray, or a data store (subclass of 
  GSGenericDataStore) otherwise an error will be thrown.

  For more information on the --type options and data sources, see the `man obex objects`.

EXAMPLES
  obex connectedTo 26355713 26355457 26420993
  obex connectedTo --st=`{(MetacelloProjectRegistration registry registrations at: 1) projectSpec}`

  obex connectedTo --name=`connected leaf objects` --type=oopArray \
                  --st=`{(MetacelloProjectRegistration registry registrations at: 1) projectSpec}`

  obex instances ObexTestObject ObexTestObjectArray; obex connectedTo --type=oopArray
  obex dataStore --stackId=objects; obex connectedTo --type=oopArray

SEE ALSO
  obex --help objects
'.
  ^ manPage