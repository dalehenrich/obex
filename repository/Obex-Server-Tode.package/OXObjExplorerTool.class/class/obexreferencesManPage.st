obex man pages
obexreferencesManPage
  | manPage |
  manPage := TDManPage
    commandName: 'instances'
    sourceMethod: self name asString , '>>obexinstances'
    fromString:
      'NAME
  obex references - New object store derived from objects referencing given objects

SYNOPSIS
  obex references [--name=<dataStore-name>] [--memory | --classes] [--exclude=<st-expression>]
                  [--st=<st-expression> | oop-or-classname...]

DESCRIPTION
  The `object references` command creates a new data source by collecting references to the given
  objects. If the --classes option is present, the command collects references to instances of the
  given class names. If the --memory option is present, the command collects references to to the 
  given objects in memory.

  For more information on the --type options and data sources, see the `man obex objects`.

EXAMPLES
  obex objects --st=`ObexTestResource current someData`
  obex dataStore --stackId=objects; obex references --exclude=`{ObexTestResource current}`

  eval `| a | a := {}. a add: (1-> a). a`; obex references --memory; obex view --detective

SEE ALSO
  obex --help objects
'.
  ^ manPage