private
_collection
  _collection value
    ifNil: [ 
      | bm |
      bm := GsBitmap new
        addAll: self _persistentOopArray;
        yourself.
      _collection value: bm ].
  ^ _collection value