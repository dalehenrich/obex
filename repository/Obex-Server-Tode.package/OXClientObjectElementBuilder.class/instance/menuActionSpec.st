menu action specs
menuActionSpec
  ^ super menuActionSpec
    ,
      {#('-').
      #('find all reference paths' nil #'findReferencePathsMenuAction:selectionIndex:')}