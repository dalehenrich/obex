printing
printOn: aStream
  aStream
    nextPutAll:
      self oop asString , '[' , self children size printString , '::'
        , self parents size printString , ']'