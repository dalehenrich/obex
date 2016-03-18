obex
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
    objects    New object store derived from lists of objects

    oops       New object store derived from list of oops
    st         New object store derived from evaluating a Smalltalk expression
    bitmap     New object store derived from set of bitmap oops
    orphans    New object store derived from orphaned class analysis
    instances  New object store derived from instances of classes

  Data Manipulation:
    datasource New object store derived from a given data store
    algebra    New object store derived via set algebra on given object stores

  Data Analysis:
    inventory  Produce an object inventory of given data source: instance and byte counts by class
    refPaths   Produce reference paths to objects in given data source
    parents    Produce parent references to objects in given data source
    spectro    Produce an object inventory that includes sample instances by class as well as instance and byte counts

  Visualization:
    view       Visualize results of data analysis

  Utility
    clear      Clear all dataStores
OPTIONS
  --help [command]
    Bring up this man page or a man page for a subCommand.
 
EXAMPLES
  obex --help

'.
  manPage subCommands yourself.
  ^ manPage