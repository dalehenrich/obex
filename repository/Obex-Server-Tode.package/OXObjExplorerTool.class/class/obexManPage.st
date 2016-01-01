obex
obexManPage
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
    calc      Calculate reference paths to given object
    clear     Clear dataStores
    datastore Return the current dataStore
    instances Run a multi-scan class instance count analysis
    scan      Scan backup file to collect collect class instance counts
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
    yourself.
  ^ manPage