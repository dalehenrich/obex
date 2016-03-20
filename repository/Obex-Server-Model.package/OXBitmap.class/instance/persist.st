persistence
persist
  "OXBitmap compat ... GsBitmap instances cannot be persisted, so an array of oops is committed by OXBitmap to share GsBitmaps between sessions --- the important bit about GsGitmap is that it can keep a very large collection of objects in memory without consuming temporary object space"

  | bm arr |
  _persistentOopArray := Array new.
  bm := _collection value.
  [ 
  | lastOop |
  "commit in chunks of 2000 objects to avoid burning through temp obj space"
  arr ifNil: [ lastOop := 0 ] ifNotNil: [ lastOop := arr at: arr size ].
  arr := bm enumerateAsOopsWithLimit: 2000 startingAfter: lastOop.
  _persistentOopArray addAll: arr.
  System commit.
  arr size ~~ 0 ]
    whileTrue.
  System commit