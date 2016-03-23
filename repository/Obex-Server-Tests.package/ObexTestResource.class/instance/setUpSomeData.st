running
setUpSomeData
  "self reset"

  | obj |
  someData := {}.
  obj := ObexTestSomeObjectByte withAll: {1}.
  someData add: obj.
  obj := ObexTestSomeObject new.
  someData add: obj.
  obj := ObexTestSomeObject new.
  someData add: obj.
  obj := ObexTestSomeObject new.
  someData add: obj