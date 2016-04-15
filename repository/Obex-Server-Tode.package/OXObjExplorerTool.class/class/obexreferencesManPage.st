obex man pages
obexreferencesManPage
  | manPage |
  manPage := TDManPage
    commandName: 'references'
    sourceMethod: self name asString , '>>obexreferences'
    fromString:
      'NAME
  obex references - New object store derived from objects referencing given objects

SYNOPSIS
  obex references [--name=<dataStore-name>] [--memory] [--exclude=<st-expression>]
                  [--st=<st-expression> | oop...]

DESCRIPTION
  The `object references` command creates a new data source by collecting references to the given
  objects using Repository>>listReferences:withLimit:withMaxThreads:maxCpuUsage:. If the --memory option 
  is present, the command collects references to to the given objects in memory using 
  Repository>>listReferencesInMemory:.

  For information on --name option and data sources, see `man obex dataStore`.

EXAMPLES
  obex objects --st=`ObexTestResource current someData`
  obex dataStore --stackId=objects; obex references --exclude=`{ObexTestResource current}`

  obex references 1234537

  eval `| a | a := {}. a add: (1-> a). a`; obex references --memory; obex view --detective

SEE ALSO
  obex --help dataStore
'.
  ^ manPage