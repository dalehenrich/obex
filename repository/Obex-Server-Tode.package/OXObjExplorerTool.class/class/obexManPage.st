obex man pages
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
    objects      New object store derived from lists of objects
    instances    New object store derived from instances of classes

  Data Manipulation:
    dataStore    New object store derived from an existing data store

    algebra      New object store derived via set algebra on given object stores

  Data Analysis:
    connectedTo  New object store derived from objects reachable from given objects
    references   New object store derived from objects referencing given objects

    inventory    Produce an object inventory of given data source: instance and byte counts by class
    refPaths     Produce reference paths to objects in given data source
    parents      Produce parent references to objects in given data source
    spectro      Produce an object inventory that includes sample instances by class as well as instance 
                 and byte counts
    orphans      New object store derived from orphaned class analysis
    objSecPolicy New object store derived from objects in given ObjectSecurityPolicies

  Visualization:
    view         Visualize results of data analysis

  Utility
    clear        Clear obex data stores

    settings     Define default values for maxPaths, maxSessions and maxPercentCPU used by repository 
                 analysis tools

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
    at: 'references' put self obexreferencesManPage;
    at: 'view' put self obexviewManPage;
    yourself.
  ^ manPage