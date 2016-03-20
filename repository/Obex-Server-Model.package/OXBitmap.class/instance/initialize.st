initilaization
initialize
  super initialize.
  _collection := TransientValue value: GsBitmap new.
  _persistentOopArray := Array new