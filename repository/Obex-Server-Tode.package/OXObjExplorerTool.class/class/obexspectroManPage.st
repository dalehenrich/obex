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
  obex spectro  [--oops=<oop-limit>]  [--max=<max-sessions>] [--pct=<pct-cpu-limit>] --classes=<class-limit> 

DESCRIPTION

EXAMPLES
  obex spectro --classes=3 
'.
  ^ manPage