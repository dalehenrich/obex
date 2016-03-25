obex man pages
obexviewManPage
  | manPage |
  manPage := TDManPage
    commandName: 'view'
    sourceMethod: self name asString , '>>obexview'
    fromString:
      'NAME
  obex view - Visualize object reference graphs and class instance counts

SYNOPSIS
  obex view --detective
---
  obex view --spectro=instances|bytes --limit=<sample-limit>
  obex view --inventory=instances|bytes --limit=<sample-limit> [--filter=<regex-pattern>]

DESCRIPTION
  The `view` command opens a Roassal-based view on the obex data store on objIn.

  With the --detective option, an initial set of objects are displayed as nodes in a Roassal view.
  Clicking on a green node (member of initial set of objects) causes the parent nodes of the selected object 
  to be displayed. Brown nodes are intermediate objects for whom the parents have yet to be calculated. Nodes 
  that have had their parents displayed are shown as purple.

EXAMPLES
  obex objects --st=`ObexTestResource current someData`
  obex references --exclude=`{ObexTestResource current}`
  obex view --detective

---
  obex view --limit=20 --inventory=bytes
  obex view --limit=20 --inventory=instances
  obex view --limit=20 --inventory=instances --filter=^string

  obex instances --classes=3 sample.dbf.gz
  obex view --detective=instances

  obex calc --maxPaths=3 --st=`{(MetacelloProjectRegistration registry registrations at: 1) projectSpec}`; obex view --detective

  obex parents --st=`{(MetacelloProjectRegistration registry registrations at: 1) projectSpec}`; obex view --detective

  obex inventory
  obex view --limit=20 --inventory=instances
  obex spectro --src=inventory --bytes --classes=3 
  obex view --limit=3 --spectro=instances 
'.
  ^ manPage