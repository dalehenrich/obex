private
_collection
  _collection value
    ifNil: [ 
      | bm |
      bm := GsBitmap new
        addAll: self persistenOopArray;
        yourself.
      _collection value: bm ].
  ^ _collection value