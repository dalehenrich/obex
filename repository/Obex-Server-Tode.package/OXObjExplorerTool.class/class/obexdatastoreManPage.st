obex
obexdatastoreManPage
  | manPage |
  manPage := TDManPage
    commandName: 'datastore'
    sourceMethod: self name asString , '>>obexdatastore'
    fromString:
      'NAME
  obex datastore - Return the current dataStore

SYNOPSIS
  obex datastore

DESCRIPTION

EXAMPLES
  obex datastore 
'.
  ^ manPage