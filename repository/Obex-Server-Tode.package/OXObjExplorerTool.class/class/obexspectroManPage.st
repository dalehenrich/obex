obex
obexspectroManPage
  | manPage |
  manPage := TDManPage
    commandName: 'spectro'
    sourceMethod: self name asString , '>>obexspectro'
    fromString:
      'NAME
  obex spectro - Produce a class spectrograph - class instance count plus sample instances

SYNOPSIS
  obex spectro  [--oops=<oop-limit>]  [--max=<max-sessions>] [--pct=<pct-cpu-limit>] 
                [--src=(inventory|spectro|scan)] (--bytes|--instances) --classes=<class-limit> 

DESCRIPTION

EXAMPLES
  obex inventory
  obex view --limit=10 --inventory=instances
  obex spectro --src=inventory --bytes --classes=3 
  obex view --detective=spectro
'.
  ^ manPage