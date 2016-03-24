analysis
analyze
  oopToNodeMap := IntegerKeyValueDictionary new.
  searchNodeMap := IdentityKeyValueDictionary new.
  self searchObjectMap
    keysAndValuesDo: [ :searchObject :ignored | 
      | node |
      node := OXSearchNode for: searchObject in: self.
      oopToNodeMap at: searchObject asOop put: node.
      self commit.
      (self searchObjectMap at: searchObject)
        do: [ :obj | self analyzeReference: obj node: node ] ].
  classNameMap := StringKeyValueDictionary new.
  oopToNodeMap values
    do: [ :node | 
      | set |
      set := classNameMap
        at: node className
        ifAbsent: [ classNameMap at: node className put: IdentitySet new ].
      set add: node ].
  self commit.
  self summary
    at: 'total objs' put: oopToNodeMap size;
    at: 'classes' put: classNameMap size;
    yourself.
  self commit