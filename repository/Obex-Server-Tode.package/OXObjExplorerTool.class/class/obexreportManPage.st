obex in-process man pages
obexreportManPage
  | manPage |
  manPage := TDManPage
    commandName: 'report'
    sourceMethod: self name asString , '>>obexreport'
    fromString:
      'NAME
  obex report - Inspector on structured report objects derived from results of data analysis

SYNOPSIS
  obex report --inventory=instances|bytes|name [--limit=<sample-limit>]

DESCRIPTION
  The `report` command opens an inspector on stuctured report data generated from the obex
  data store on objIn.

EXAMPLES
  obex inventory
  obex report --limit=20 --inventory=instances
  obex report --inventory=instances
  obex report --inventory=bytes
  obex report --inventory=name
'.
  ^ manPage