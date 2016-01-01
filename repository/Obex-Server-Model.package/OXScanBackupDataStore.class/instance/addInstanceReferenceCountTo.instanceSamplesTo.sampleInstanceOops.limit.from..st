instance reference count analysis
addInstanceReferenceCountTo: instanceRefDictionary instanceSamplesTo: sampleDictionary sampleInstanceOops: sampleInstanceOops limit: limit from: logRecord
  | offset objects bytes |
  offset := 33.	"(28 / 8) ceiling * 8 + 1."
  objects := OrderedCollection new.
  bytes := logRecord bytes.
  logRecord numObjs
    timesRepeat: [ 
      | header |
      header := ObjHdr_64
        bytes: (bytes copyFrom: offset to: ObjHdr_64 byteSize + offset - 1).
      header isOops
        ifTrue: [ 
          | object classOop count samples |
          classOop := header classOop.
          object := bytes
            copyFrom: ObjHdr_64 byteSize + offset
            to: offset + header physSize - 1.
          1 to: header gcSize do: [ :i | 
            | logOop |
            logOop := logRecord int64At: (i - 1) * 8 + 1 in: object.
            (sampleInstanceOops includes: logOop)
              ifTrue: [ 
                count := instanceRefDictionary at: classOop ifAbsentPut: [ 0 ].
                instanceRefDictionary at: classOop put: count + 1.
                samples := sampleDictionary
                  at: classOop
                  ifAbsentPut: [ Set new ].
                (limit isNil or: [ samples size <= limit ])
                  ifTrue: [ 
                    | refOop obj |
                    refOop := header objId.
                    [ 
                    obj := Object _objectForOop: refOop.
                    obj class asOop == classOop
                      ifTrue: [ samples add: refOop ] ]
                      on: SecurityError
                      do: [ :ignored |  ] ] ] ] ].
      offset := offset + header physSize ]