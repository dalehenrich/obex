obex
obexManPage
  | manPage |
  manPage := TDManPage commandName: 'obex' fromString: 'NAME
  obex - Roassal-based tool for analyzing object reference paths

SYNOPSIS
  obex [--help] <command> [<options>] [ <priority>... ]

DESCRIPTION
  Commands:
    calc  Calculate reference paths to given object
    clear Clear reference path cache
    view  Browse reference paths to given objects

OPTIONS
  --help [<command>]
    Bring up this man page or a man page for a subCommand.
 
EXAMPLES
  obex --help

'.
  manPage subCommands
    at: 'calc' put: self obexcalcManPage;
    at: 'view' put: self obexviewManPage;
    at: 'clear' put: self obexclearManPage;
    yourself.
  ^ manPage