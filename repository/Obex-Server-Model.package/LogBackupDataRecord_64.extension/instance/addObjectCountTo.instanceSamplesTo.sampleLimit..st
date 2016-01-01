*obex-server-model
addObjectCountTo: classDictionary instanceSamplesTo: sampleDictionary sampleLimit: sampleLimit
  | offset objects |
  offset := 33.	"(28 / 8) ceiling * 8 + 1."
  objects := OrderedCollection new.
  self numObjs
    timesRepeat: [ 
      | header classOop count samples |
      header := ObjHdr_64
        bytes: (bytes copyFrom: offset to: ObjHdr_64 byteSize + offset - 1).
      classOop := header classOop.
      count := classDictionary at: classOop ifAbsentPut: [ 0 ].
      classDictionary at: classOop put: count + 1.
      samples := sampleDictionary at: classOop ifAbsentPut: [ Set new ].
      samples size < sampleLimit
        ifTrue: [ 
          | oop obj |
          oop := header objId.
          [ 
          obj := Object _objectForOop: oop.
          obj class asOop == classOop
            ifTrue: [ samples add: oop ] ]
            on: SecurityError
            do: [ :ignored |  ] ].
      offset := offset + header physSize ]