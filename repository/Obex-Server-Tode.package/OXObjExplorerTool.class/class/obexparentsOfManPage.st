obex man pages
obexparentsOfManPage
  | manPage |
  manPage := TDManPage
    commandName: 'parentsOf'
    sourceMethod: self name asString , '>>obexparentsOf'
    fromString:
      'NAME
  obex parentsOf - New object store derived from objects referencing given objects (GemStone 3.4 and later)

SYNOPSIS
  obex parentsOf [--name=<dataStore-name>] [--exclude=<st-expression>] [--st=<st-expression> | oop...]

DESCRIPTION
  The `object parents` command creates a new data source by collecting references to the given
  objects using Repository>>findReferencePathToObjs:limitArray: (available in GemStone 3.4 and later).

  For more information on the --type options and data sources, see the `man obex objects`.

EXAMPLES
  obex objects --st=`ObexTestResource current someData`
  obex dataStore --stackId=objects; obex parentsOf --exclude=`{ObexTestResource current}`

  obex parentsOf 1234537

SEE ALSO
  obex --help objects
'.
  ^ manPage