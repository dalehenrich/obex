obex
obexinstancesManPageX
  | manPage |
  manPage := TDManPage
    commandName: 'instances'
    sourceMethod: self name asString , '>>obexinstances'
    fromString:
      'NAME
  obex instances - Run a multi-scan class instance count analysis

SYNOPSIS
  obex instances [--dir=<backup-directory>] [--backup] [--oops=<oop-limit>]
                 --classes=<class-limit>  <backup-file-name>

DESCRIPTION

EXAMPLES
  obex instances --classes=3 sample.dbf.gz
  obex view --detective=instances
'.
  ^ manPage