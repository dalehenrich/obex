obex
obexscanManPage
  | manPage |
  manPage := TDManPage
    commandName: 'scan'
    sourceMethod: self name asString , '>>obexscan'
    fromString:
      'NAME
  obex scan - Scan backup file to collect collect class instance counts

SYNOPSIS
  obex scan [--dir=<backup-directory>] [--backup] [--samples=<sample-limit>] <backup-file-name>

DESCRIPTION
OPTIONS
  --backup
    Make a fresh backup of the repository before running the scan

  --dir=<backup-directory>
    Use the given directory, instead of the standard backup directory.

  --samples=<sample-limit>
    Collect data on class instances and collect <sample-limit> instaces  of the class.

EXAMPLES
  obex scan sample.dbf.gz
  obex scan --samples=20 wip.dbf.gz
  obex scan --backup sample.dbf.gz
  obex scan --dir=$GS_HOME/local/server/backups sample.dbf.gz

SEE ALSO
  bu --help restore
  bu --help backup
'.
  ^ manPage