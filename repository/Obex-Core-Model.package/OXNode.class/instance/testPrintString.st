printing
testPrintString
  "omit oop so that printString can be used in validating tests"

  | ws str |
  str := String new.
  ws := PrintStream printingOn: str.
  self testPrintOn: ws.
  ^ ws _collection	"contents might have been converted to another subclass of CharacterCollection."