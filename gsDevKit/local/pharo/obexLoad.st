| gs_home |
Metacello image
  baseline: 'Tode';
  load.
gs_home := Smalltalk os environment at: 'GS_HOME'. 
Metacello new
  baseline: 'Obex'; 
  repository: 'filetree://', gs_home, '/shared/repos/obex/repository'; 
  load: 'Core'.

