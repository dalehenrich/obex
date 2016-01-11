analysis
analyzeReferenceArray: ar node: node
  1 to: ar size do: [ :index | 
    | referenceObject theNode |
    referenceObject := ar at: index.
    Transcript
      cr;
      show:
          index printString , ' ' , referenceObject class printString , ' '
              , referenceObject asOop printString.
    theNode := self lookupNodeForObject: referenceObject rootNode: false.
    node addParent: theNode.
    theNode addChild: node ].
  searchNodeMap at: node ifAbsent: [ searchNodeMap at: node put: {} ].	"searchNodeMap keys aren't used, methinks"
  self commit