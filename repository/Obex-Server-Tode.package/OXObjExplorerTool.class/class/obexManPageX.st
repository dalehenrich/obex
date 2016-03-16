obex
obexManPageX
  | manPage |
  manPage := TDManPage
    commandName: 'obex'
    fromString:
      'NAME
  obex - Roassal-based tool for analyzing object reference paths

SYNOPSIS
  obex [--help] [--dataStore=<data-store-name>] <command> [<options>]

DESCRIPTION
  Commands:
    calc      Calculate reference paths to given object (Repository>>findAllReferencePathsToObjects:)
    clear     Clear dataStores
    datastore Return the current dataStore
    instances Run a multi-scan class instance count analysis
    inventory GsObjectInventory analysis
    orphans   Find references to instances of Metaclass3 that are not members of a ClassHistory
    parents   Calculate reference path parents of given objects [V3.4 only]
    scan      Scan backup file to collect collect class instance counts
    spectro   Produce a class spectrograph - class instance count plus sample instances [V3.4 only]
    view      Visualize object reference graphs and class instance counts

OPTIONS
  --help [command]
    Bring up this man page or a man page for a subCommand.
 
  --dataStore=<data-store-name>
    Specify that the named data store be used for the operation

EXAMPLES
  obex --help

'.
  manPage subCommands
    at: 'calc' put: self obexcalcManPage;
    at: 'view' put: self obexviewManPage;
    at: 'clear' put: self obexclearManPage;
    at: 'scan' put: self obexscanManPage;
    at: 'datastore' put: self obexdatastoreManPage;
    at: 'instances' put: self obexinstancesManPage;
    at: 'inventory' put: self obexinventoryManPage;
    at: 'spectro' put: self obexspectroManPage;
    at: 'orphans' put: self obexorphansManPage;
    at: 'parents' put: self obexparentsManPage;
    yourself.
  ^ manPage