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
  obex spectro --src=inventory --bytes --classes=3 
'.
  ^ manPage