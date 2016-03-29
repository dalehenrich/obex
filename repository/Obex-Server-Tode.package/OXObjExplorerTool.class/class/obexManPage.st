obex in-process man pages
obexManPage
  | manPage |
  manPage := TDManPage
    commandName: 'obex'
    fromString:
      'NAME
  obex - Roassal-based tool for analyzing object reference paths

SYNOPSIS
  obex [--help] <command> [<options>]

DESCRIPTION
  Data Sources:
    objects        New object store derived from lists of objects
    instances      New object store derived from instances of classes

    inventory      Produce an object inventory of given data source: instance and byte counts by class

  Data Manipulation:
    dataStore      New object store derived from an existing data store

  Object Reference Analysis:
    connectedTo    New object store derived from objects reachable from given objects
    parentsOf      New object store derived from objects referencing given objects (GemStone 3.4 and later)
    references     New object store derived from objects referencing given objects
    referencePaths New object store derived from all reference path for given objects

    spectro        Produce an object inventory that includes sample instances by class as well as instance 
                   and byte counts
    orphans        New object store derived from orphaned class analysis
    objSecPolicy   New object store derived from objects in given ObjectSecurityPolicies

  Visualization:
    view           Visualize results of data analysis

  Utility
    clear          Clear obex data stores

    settings       Define default values for maxPaths, maxSessions and maxPercentCPU used by repository 
                   analysis tools (--fast --slow, individual tuning)

OPTIONS
  --help [command]
    Bring up this man page or a man page for a subCommand.
 
EXAMPLES
  obex --help

'.
  manPage subCommands
    at: 'objects' put: self obexobjectsManPage;
    at: 'instances' put: self obexinstancesManPage;
    at: 'connectedTo' put: self obexconnectedToManPage;
    at: 'dataStore' put: self obexdataStoreManPage;
    at: 'clear' put: self obexclearManPage;
    at: 'references' put: self obexreferencesManPage;
    at: 'view' put: self obexviewManPage;
    at: 'parentsOf' put: self obexparentsOfManPage;
    at: 'referencePaths' put: self obexreferencePathsManPage;
    yourself.
  ^ manPage