printing
printOn: aStream
  parents
    ifNil: [ 
      "printing should not trigger dynamic caclulation of parents"
      aStream nextPutAll: self className , ', ' , self oop asString , '[-::-]' ]
    ifNotNil: [ 
      aStream
        nextPutAll:
          self className , ', ' , self oop asString , '[' , self children size printString
            , '::' , self parents size printString , ']' ]