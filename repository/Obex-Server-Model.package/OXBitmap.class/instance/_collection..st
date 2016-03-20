private
_collection: _bitmap
  _collection
    ifNil: [ _collection := TransientValue value: _bitmap ]
    ifNotNil: [ _collection value: _bitmap ]