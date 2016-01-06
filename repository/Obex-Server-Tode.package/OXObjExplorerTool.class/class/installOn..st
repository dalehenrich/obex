initialization
installOn: aTDTopezServer
  "self install"

  super installOn: aTDTopezServer.
  TDTopezServer
    registerEditorClass: OXClientObjectElementBuilder
      for: Object
      aspect: #'navigateOX';
    yourself