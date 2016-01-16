running
setUpSimpleData
  "self reset"

  | ar obj |
  simpleData := ObexTestObject new.
  simpleLeaves := {}.
  excludedParentsArray := {simpleLeaves.
  self}.
  ar := ObexTestObjectArray new.
  1 to: 3 do: [ :index | 
    obj := ObexTestObjectByte withAll: {index}.
    simpleLeaves add: obj.
    ar add: obj ].
  simpleData slot1: ar.
  ar := ObexTestObjectArray new.
  obj := ObexTestObject1 new.
  simpleLeaves add: obj.
  ar add: obj.
  2
    timesRepeat: [ 
      obj := ObexTestObject2 new.
      simpleLeaves add: obj.
      ar add: obj ].
  3
    timesRepeat: [ 
      obj := ObexTestObject3 new.
      simpleLeaves add: obj.
      ar add: obj.
      simpleData slot2: ar ]