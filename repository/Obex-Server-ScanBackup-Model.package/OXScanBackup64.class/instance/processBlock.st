accessing
processBlock
  processBlock
    ifNil: [ processBlock := [ :logHdr :logRecord | logRecord addObjectCountTo: classes ] ].
  ^ processBlock