initialization
installOn: aTDTopezServer
  "self install"

  super installOn: aTDTopezServer.
  TDTopezServer
    registerEditorClass: OXClientObjectElementBuilder
      for: Object
      aspect: #'navigateOX';
    yourself.
  Smalltalk
    at: #'GsBitmap'
    ifPresent: [ :cls | 
      TDTopezServer
        registerBuilderClass: TDGsBitmapNodeBuilder
          for: GsBitmap
          aspect: #'view';
        yourself ]