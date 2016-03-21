obex man pages
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
   
    
EXAMPLES
  obex objects -h

  obex dataStore --stackId=object
  obex dataStore `leaf objects`
'.
  ^ manPage