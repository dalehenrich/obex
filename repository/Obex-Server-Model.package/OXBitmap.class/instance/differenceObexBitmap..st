double dispatching
differenceObexBitmap: anObexBitmap
  | _differenceBitmap |
  _differenceBitmap := _collection difference: anObexBitmap _collection.
  ^ self class basicNew
    _collection: _differenceBitmap;
    yourself