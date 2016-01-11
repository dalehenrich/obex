accessing
searchObjectMap
  searchObjectMap
    ifNil: [ 
      | map ar |
      map := IdentityKeyValueDictionary new.
      ar := self searchResult.
      map at: (ar at: 1) put: (ar at: 4).
      searchObjectMap := TransientValue value: map ].
  ^ searchObjectMap value