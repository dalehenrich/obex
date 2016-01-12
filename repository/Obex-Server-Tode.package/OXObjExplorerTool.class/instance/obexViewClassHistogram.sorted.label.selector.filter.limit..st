obex view
obexViewClassHistogram: dataStore sorted: sortedList label: label selector: selector filter: regexPattern limit: limit
  | clientElement viewLimit sorted |
  clientElement := OXHistogramClientElement new
    graphicLabel: label;
    dataPointSelector: selector;
    theObject: dataStore;
    usePersistentClientElementCache: true;
    windowBuilder: self;
    editorAspectSelector: #'activateObjectExplorerEditor';
    editorWindowLabel: 'xxx';
    editorWindowLocation: #'method';
    topez: self topez;
    timestamp;
    yourself.
  sorted := sortedList.
  sorted isEmpty
    ifTrue: [ self error: 'There are no elements in the ' , label ].
  regexPattern
    ifNotNil: [ 
      | findTool regex |
      findTool := self topez toolInstanceFor: 'find'.
      regex := findTool findRegex: regexPattern.
      sorted := sorted select: [ :each | regex search: each label ] ].
  viewLimit := limit min: sorted size.
  clientElement dataPoints: (sorted copyFrom: 1 to: viewLimit).
  self topez cacheClientElement: clientElement.
  self topez editElement: clientElement