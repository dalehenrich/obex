analysis
addObjectCountTo: classDictionary instanceSamplesTo: sampleDictionary sampleClassOops: sampleClassOops limit: limit from: logRecord
  | offset objects |
  offset := 33.	"(28 / 8) ceiling * 8 + 1."
  objects := OrderedCollection new.
  logRecord numObjs
    timesRepeat: [ 
      | header classOop count samples |
      header := ObjHdr_64
        bytes:
          (logRecord bytes copyFrom: offset to: ObjHdr_64 byteSize + offset - 1).
      classOop := header classOop.
      count := classDictionary at: classOop ifAbsentPut: [ 0 ].
      classDictionary at: classOop put: count + 1.
      (sampleClassOops includes: classOop)
        ifTrue: [ 
          samples := sampleDictionary at: classOop ifAbsentPut: [ Set new ].
          (limit isNil or: [ samples size <= limit ])
            ifTrue: [ 
              | oop obj |
              oop := header objId.
              [ 
              obj := Object _objectForOop: oop.
              obj class asOop == classOop
                ifTrue: [ samples add: oop ] ]
                on: SecurityError
                do: [ :ignored |  ] ].
          self commit ].
      offset := offset + header physSize ]