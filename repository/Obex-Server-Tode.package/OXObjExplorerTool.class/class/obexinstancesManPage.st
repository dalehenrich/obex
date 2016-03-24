obex man pages
obexinstancesManPage
  | manPage |
  manPage := TDManPage
    commandName: 'instances'
    sourceMethod: self name asString , '>>obexinstances'
    fromString:
      'NAME
  obex instances - New object store derived from instances of classes

SYNOPSIS
  obex instances [--name=<dataStore-name>] [--type=array|set|oopArray|oopSet|bitmap]
                 [--st=<st-expression> | className...]

DESCRIPTION
  The `object instances` command creates a new data source by collecting instances of the given
  class names.

  Class names may be explicitly specified on the command line, as a smalltalk expression (--st) or from 
  objIn. The class name arguments must match the name of a class exactly. If the --st option is used, the 
  smalltalk expression must return a collection of classes or an object that responds to #asArray. objIn 
  must be a collection of classes or an object that responds to #asArray.

  For more information on the --type options and data sources, see the `man obex objects`.

EXAMPLES
  obex instances ObexTestObject ObexTestObjectArray
  obex instances --name=`test resource classes` ObexTestObject ObexTestObjectArray

  obex instances --st=`ObexTestObject subclasses`
  obex instances --st=`ObexTestObject subclasses` --type=oopSet

  eval `{ObexTestObject. ObexTestObjectArray}`; obex instances

SEE ALSO
  obex --help objects
'.
  ^ manPage