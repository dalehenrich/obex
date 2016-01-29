printing
printOn: aStream
  aStream
    nextPutAll:
      self dataPoint label , '[' , self children size printString , '::'
        , self parents size printString , ']'