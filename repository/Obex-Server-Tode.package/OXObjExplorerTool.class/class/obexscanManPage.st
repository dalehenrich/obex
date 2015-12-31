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
  obex scan

DESCRIPTION
OPTIONS

EXAMPLES
  obex scan
  obex --dataStore=OX_Index_1 scan
'.
  ^ manPage