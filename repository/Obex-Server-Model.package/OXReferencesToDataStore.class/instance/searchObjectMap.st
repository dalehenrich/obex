accessing
searchObjectMap
  self rawSearchObjectMap value
    ifNil: [ 
      | map targets results |
      map := IdentityKeyValueDictionary new.
      targets := self rawTargetObjects value.
      results := self searchResult.
      1 to: targets size do: [ :index | map at: (targets at: index) put: (results at: index) ].
      self inMemory
        ifTrue: [ self excludedArray add: map ].
      self rawSearchObjectMap value: map ].
  ^ searchObjectMap value