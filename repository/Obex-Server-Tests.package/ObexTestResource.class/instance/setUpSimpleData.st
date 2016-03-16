running
setUpSimpleData
  "self reset"

  | arb ar2 ar3 obj |
  simpleData := ObexTestObject new.
  simpleLeaves := {}.
  simpleDataExcludedParents := {self.
  simpleLeaves}.
  simpleDataExcludedParents add: simpleDataExcludedParents.
  arb := ObexTestObjectArray new.
  simpleData slot1: arb.
  1 to: 3 do: [ :index | 
    obj := ObexTestObjectByte withAll: {index}.
    simpleLeaves add: obj.
    arb add: obj ].
  obj := ObexTestObject1 new.
  simpleData
    slot2:
      (ObexTestObjectArray new
        add: obj;
        yourself).
  simpleLeaves add: obj.
  ar2 := ObexTestObjectArray new.
  simpleData
    slot3:
      (ObexTestObjectArray new
        add: ar2;
        yourself).
  2
    timesRepeat: [ 
      obj := ObexTestObject2 new.
      simpleLeaves add: obj.
      ar2 add: obj ].
  ar3 := ObexTestObjectArray new.
  simpleData
    slot4:
      (ObexTestObjectArray new
        add:
            (ObexTestObjectArray new
                add: ar3;
                yourself);
        yourself).
  3
    timesRepeat: [ 
      obj := ObexTestObject3 new.
      simpleLeaves add: obj.
      ar3 add: obj ]