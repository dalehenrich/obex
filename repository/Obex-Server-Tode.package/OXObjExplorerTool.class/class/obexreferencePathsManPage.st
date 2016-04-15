obex man pages
obexreferencePathsManPage
  | manPage |
  manPage := TDManPage
    commandName: 'referencePaths'
    sourceMethod: self name asString , '>>obexreferencePaths'
    fromString:
      'NAME
  obex referencePaths - New object store derived from all reference path for given objects

SYNOPSIS
  obex referencePaths [--name=<dataStore-name>] [--maxPaths=<max-ref-paths>] [--limit=<st-expression>] 
                      [--st=<st-expression> | oop...]

DESCRIPTION
  The `object referencePaths` command creates a new data source by collecting all reference paths to the 
  given objects using 
  Repository>>Repository>>findAllReferencePathsToObjects:limitObjArray:printToLog:maxPaths:. 

  If the --limit option is not specified, a minimal limit set as defined by 
  OXGenericRefPathDataStore class>>minLimitSetForRefPathScan is used.

  If the --limit option is used, an Array of objects is expect and it will be used as the `limitObjArray` 
  argument in the findAllReferencePaths call.

  For information on --name option and data sources, see `man obex dataStore`.

EXAMPLES
  obex objects --st=`ObexTestResource current someData`
  obex dataStore --stackId=objects; obex referencePaths

  obex referencePaths 1234537

  obex instances TDTopezServer
  eval `self objects asArray reject: [:each | TDTopezServer instanceMap includes: each]`
  obex referencePaths --limit=`SystemRepository buildLimitSetForRefPathScan`
  obex view --detective

  gs flushCaches --hard
  gs mfc
  abort
  gs reclaimAll
  obex instances TDTopezServer
  eval `self objects asArray reject: [:each | TDTopezServer instanceMap includes: each]`
  obex referencePaths
  obex view --detective  # should be empty

SEE ALSO
  obex --help objects
  obex --help dataStore
'.
  ^ manPage