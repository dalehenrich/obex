obex report
obexReportClassInstancesCount: obexInstanceCountDataStore label: label sortSelector: sortSelector limit: limit
  | sorted sel |
  sel := sortSelector == #'name'
    ifTrue: [ #'sortedClassInstanceCountList' ]
    ifFalse: [ sortSelector ].
  sorted := obexInstanceCountDataStore perform: sel.
  sortSelector == #'name'
    ifTrue: [ sorted := sorted sortBy: [ :a :b | a className <= b className ] ].
  limit ifNotNil: [ sorted := sorted copyFrom: 1 to: (sorted size min: limit) ].
  sorted
    editUsing:
      ((TDEditorSpec topez: topez editorAspect: #'edit')
        builderAspect: #'view';
        windowLabel: label;
        windowLocation: #'inspector';
        windowName: #'obexReport';
        yourself).
  ^ sorted