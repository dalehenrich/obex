tests
testOXBitmap
  | bm1 bm2 objects pa oops |
  objects := {(Object new).
  (Object new)}.
  oops := objects collect: [ :each | each asOop ].
  bm1 := OXBitmap from: objects.
  bm1 persist.
  pa := bm1 _persistentOopArray.
  self assert: pa size = oops size.
  pa do: [ :oop | oops includes: oop ].
  bm2 := bm1 copy.
  self assert: (bm2 equals: bm1)