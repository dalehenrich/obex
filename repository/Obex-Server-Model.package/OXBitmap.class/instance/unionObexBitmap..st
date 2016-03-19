double dispatching
unionObexBitmap: anObexBitmap
  | _unionBitmap |
  _unionBitmap := _collection union: anObexBitmap _collection.
  ^ self class basicNew
    _collection: _unionBitmap;
    yourself