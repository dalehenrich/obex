menu action specs
menuActionSpec
  ^ super menuActionSpec
    ,
      {#('-').
      #('pointer detective' nil #'findReferencePathsMenuAction:selectionIndex:')}