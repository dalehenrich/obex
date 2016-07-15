running
setUpSimpleMultipleParentsData
  "self reset"

  | ar1 ar2 ar3 obj |
  simpleMultipleParentsData := ObexTestObject new.
  obj := ObexTestObject1 new.
  ar1 := ObexTestObjectArray new.
  ar1 add: obj.
  simpleMultipleParentsData slot1: ar1.
  simpleMultipleParentsData slot2: ar1.
  ar2 := ObexTestObjectArray new.
  ar2 add: ar1.
  simpleMultipleParentsData slot3: ar2.
  ar3 := ObexTestObjectArray new.
  ar3 add: ar1.
  simpleMultipleParentsData slot4: ar3