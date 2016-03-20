obex man pages
obexobjectsManPage
  | manPage |
  manPage := TDManPage
    commandName: 'objects'
    sourceMethod: self name asString , '>>obexobjects'
    fromString:
      'NAME
  obex objects - New object store derived from lists of objects

SYNOPSIS
  obex objects [--name=<dataStore-name>] [--type=array|set|oopArray|oopSet|bitmap|asis]
               [--st=<st-expression> | oop...] 

DESCRIPTION
  The `objects` data store in obex is a data store stack that acts as a data source for additional 
  analyses. The `obex objects` command adds a new data store to the stack. 

  Objects may be specified as a smalltalk expression (--st), a list of oops, or from objIn. The smalltalk 
  expression should return a collection of objects or an object that responds to #asArray. objIn must be a
  collection of objects or a data store (subclass of GSGenericDataStore) otherwise an error will be 
  thrown.

  The type of storage used is controlled by the --type option. The `array` and `set` types store the 
  objects in either an Array or IdentitySet, the objects are stored as objects. The `oopArray` and 
  `oopSet` types store the objects in either an Array or IdentitySet, but instead of storing a reference 
  to the object, the oop of the object is stored. The `bitmap` type stores the objects in a GsBitmap, 
  which like the `oopArray` and `oopSet` stores only the oop of the objects. The `bitmap` type is only 
  available in GemStone 3.4. 

  The `asis` type, simply stores the object as is, with no conversion.

  The advantage of the `oop*` and `bitmap`types is that the objects will not show up in a find instances 
  or find references analysis. The advantage of the `bitmap` type is that the storage for the oops is very
  efficient and does not consume temp object space, so are very useful for managing large numbers of 
  objects.

  The default type is `bitmap`.

EXAMPLES
  obex objects -h

  obex objects 26355713 26355457 26420993
  obex objects --st=`{(MetacelloProjectRegistration registry registrations at: 1) projectSpec}`

  obex objects --type=oopArray --st=`ObexTestResource current simpleLeaves`
  obex objects --type=set --st=`ObexTestResource current simpleLeaves`
  obex objects --type=bitmap --st=`ObexTestResource current simpleLeaves`

  obex objects --name=`leaf objects` --type=oopArray --st=`ObexTestResource current simpleLeaves`

  eval `{Object new}`; obex objects
'.
  ^ manPage