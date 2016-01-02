initialization
installOn: aTDTopezServer
  "self install"

  TDTopezServer
    registerEditorClass: OXClientObjectElementBuilder
      for: Object
      aspect: #'navigateOX';
    yourself