printing
testPrintOn: aStream
  "omit oop so that printString can be used in validating tests"

  aStream
    nextPutAll:
      self className , ', [' , self children size printString , '::'
        , self parents size printString , ']'