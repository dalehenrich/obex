obex
obexviewManPage
  | manPage |
  manPage := TDManPage
    commandName: 'view'
    sourceMethod: self name asString , '>>obexview'
    fromString:
      'NAME
  obex view - Visualize object reference graphs and class instance counts

SYNOPSIS
  obex view --detective=(reference|instances|spectro|parents)
  obex view --scan=<class-limit>
  obex view --inventory=instances|bytes [--limit=<sample-limit>] [--filter=<regex-pattern>]

DESCRIPTION
OPTIONS

  Note: `--detective=spectro` and `--detective=parents` available only in GemStone 3.4 and behond

EXAMPLES
  obex view --detective=reference
  obex view --scan=20
  obex view --limit=20 --inventory=bytes
  obex view --limit=20 --inventory=instances
  obex view --limit=20 --inventory=instances --filter=^string

  obex scan sample.dbf.gz
  obex view --scan=20

  obex instances --classes=3 sample.dbf.gz
  obex view --detective=instances

  obex calc --maxPaths=3 --st=`{(MetacelloProjectRegistration registry registrations at: 1) projectSpec}`
  obex view --detective=reference

  obex parents --st=`{(MetacelloProjectRegistration registry registrations at: 1) projectSpec}`
  obex view --detective=parents

  obex inventory
  obex view --limit=20 --inventory=instances
  obex spectro --src=inventory --bytes --classes=3 
  obex view --detective=spectro
'.
  ^ manPage