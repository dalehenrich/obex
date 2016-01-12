analysis
analyzeReferenceArray: ar node: node
  1 to: ar size do: [ :index | 
    | referenceOop theNode |
    referenceOop := ar at: index.
    theNode := self lookupNodeForOop: referenceOop rootNode: false.
    node addParent: theNode.
    theNode addChild: node ].
  searchNodeMap at: node ifAbsent: [ searchNodeMap at: node put: {} ].	"searchNodeMap keys aren't used, methinks"
  self commit