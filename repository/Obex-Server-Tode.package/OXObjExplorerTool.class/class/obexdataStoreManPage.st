obex in-process man pages
obexdataStoreManPage
  | manPage |
  manPage := TDManPage
    commandName: 'dataStore'
    sourceMethod: self name asString , '>>obexdataStore'
    fromString:
      'NAME
  obex dataStore - New object store derived from an existing data store

SYNOPSIS
  obex dataStore --stackId=objectInventory|objects|parentsOf|referencePaths|spectro | <dataStore-name>

DESCRIPTION

  [SHOULD HAVE args for listing names ...]
   
    
EXAMPLES
  obex dataStore --stackId=objects
  obex dataStore `leaf objects`
'.
  ^ manPage