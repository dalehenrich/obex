obex
obexobjectsManPage
  | manPage |
  manPage := TDManPage
    commandName: 'objects'
    sourceMethod: self name asString , '>>obexobjects'
    fromString:
      'NAME
  obex objects - New object store derived from lists of objects

SYNOPSIS
  obex objects --st=<st-expression> | oop... 

DESCRIPTION
  The `object` data store in obex is a stack of collections that are used as source lists 
  By default, list the oops for objects you wish stored in the object data store. 
OPTIONS

EXAMPLES
  obex objects -h
'.
  ^ manPage