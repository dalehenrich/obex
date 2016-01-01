instance reference count analysis
addInstanceReferenceCountTo: instanceRefDictionary instanceSamplesTo: sampleDictionary instanceClassOops: instanceClassOops sampleLimit: sampleLimit from: logRecord
  | offset objects |
  offset := 33.	"(28 / 8) ceiling * 8 + 1."
  objects := OrderedCollection new.
  logRecord numObjs
    timesRepeat: [ 
      | header classOop count samples |
      header := ObjHdr_64
        bytes:
          (logRecord bytes copyFrom: offset to: ObjHdr_64 byteSize + offset - 1).
      header isOops
        ifTrue: [ 
          classOop := header classOop.
          count := instanceRefDictionary at: classOop ifAbsentPut: [ 0 ].
          instanceRefDictionary at: classOop put: count + 1.
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
                do: [ :ignored |  ] ] ].
      offset := offset + header physSize ]