obex
obexsetupManPage
  | manPage |
  manPage := TDManPage
    commandName: 'setup'
    sourceMethod: self name asString , '>>obexsetup'
    fromString:
      'NAME
  obex setup - Set up for performing multi threaded scans of the repository

SYNOPSIS
  obex setup [--max=<max-sessions>] [--pct=<pct-cpu-limit>]  [--lockWait=<lock-wait-time>]
             [--bufSize=<page-buffer-size>] 

DESCRIPTION

OPTIONS

EXAMPLES
  obex setup 
  obex setup --max=5 --pct=80
'.
  ^ manPage