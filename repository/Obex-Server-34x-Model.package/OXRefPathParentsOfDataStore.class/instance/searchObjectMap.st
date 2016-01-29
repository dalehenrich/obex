accessing
searchObjectMap
  searchObjectMap
    ifNil: [ 
      | map ar |
      map := IdentityKeyValueDictionary new.
      self searchResult
        do: [ :parentsInfo | map at: parentsInfo target put: parentsInfo parentOops ].
      searchObjectMap := TransientValue value: map ].
  ^ searchObjectMap value