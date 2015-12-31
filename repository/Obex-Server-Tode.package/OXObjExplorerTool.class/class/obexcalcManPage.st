obex
obexcalcManPage
  | manPage |
  manPage := TDManPage
    commandName: 'calc'
    sourceMethod: self name asString , '>>obexcalc'
    fromString:
      'NAME
  obex calc - Calculate reference paths to given object

SYNOPSIS
  obex calc [--maxPaths=<max-paths>] --st=<st-expression> | oop... 

DESCRIPTION
OPTIONS

EXAMPLES
  obex -h

  obex calc --maxPaths=3 --st=`{(MetacelloProjectRegistration registry registrations at: 1) projectSpec}`

  obex calc 452261889
  obex calc --maxPaths=3 452261889
  obex --dataStore=OX_Index_1 calc --maxPaths=3 452261889
'.
  ^ manPage