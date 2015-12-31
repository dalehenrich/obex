*obex-client-tode
objectExplorerEditor
  objectExplorerEditor
    ifNil: [ 
      objectExplorerEditor := OXPointerDetectiveEditor new.
      objectExplorerEditor
        editor: self;
        addDependent: self ].
  ^ objectExplorerEditor