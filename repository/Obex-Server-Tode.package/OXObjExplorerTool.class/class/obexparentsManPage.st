obex
obexparentsManPage
  | manPage |
  manPage := TDManPage
    commandName: 'parents'
    sourceMethod: self name asString , '>>obexparents'
    fromString:
      'NAME
  obex parents - Calculate reference path parents of given objects

SYNOPSIS
  obex parents --st=<st-expression> | oop... 

DESCRIPTION
  Repository>>findAllReferencePathsToObjects:

OPTIONS

EXAMPLES
  obex -h

  obex setup

  obex parents --st=`{(MetacelloProjectRegistration registry registrations at: 1) projectSpec}`
  obex view --detective=reference

  obex parents 452261889

  obex parents 452261889
  obex view --detective=parentss
'.
  ^ manPage