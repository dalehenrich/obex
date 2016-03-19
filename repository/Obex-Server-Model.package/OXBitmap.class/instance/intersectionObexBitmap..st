double dispatching
intersectionObexBitmap: anObexBitmap
  | _intersectBitmap |
  _intersectBitmap := self _collection intersect: anObexBitmap _collection.
  ^ self class basicNew
    _collection: _intersectBitmap;
    yourself