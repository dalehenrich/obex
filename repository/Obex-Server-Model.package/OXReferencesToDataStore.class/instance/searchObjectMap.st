accessing
searchObjectMap
  searchObjectMap
    ifNil: [ 
      | map targets results |
      map := IdentityKeyValueDictionary new.
      targets := targetObjects value.
      results := self searchResult.
      1 to: targets size do: [ :index | map at: (targets at: index) put: (results at: index) ].
      searchObjectMap := TransientValue value: map ].
  ^ searchObjectMap value