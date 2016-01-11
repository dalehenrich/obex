accessing
searchObjectMap
  searchObjectMap
    ifNil: [ 
      | map ar |
      map := IdentityKeyValueDictionary new.
      self searchResult do: [ :ar | map at: (ar at: 1) put: (ar at: 4) ].
      searchObjectMap := TransientValue value: map ].
  ^ searchObjectMap value